import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frappify/apps/apps.dart';
import 'package:frappify/dashboard/view/view.dart';
import 'package:frappify/desk/desk.dart';
import 'package:frappify/settings/settings.dart';
import 'package:frappify/utils/utils.dart';
import 'package:frappify/workspace/view/view.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DeskView extends StatefulWidget {
  const DeskView({super.key});

  @override
  State<DeskView> createState() => _DeskViewState();
}

class _DeskViewState extends State<DeskView> {
  final notificationsPopoverController = ShadPopoverController();
  final helpPopoverController = ShadPopoverController();
  final profilePopoverController = ShadPopoverController();
  int _selectedIndex = 0;
  bool _isSidebarOpen = true;
  final Set<String> _expandedWorkspaces = <String>{};
  bool fullWidth = false;

  @override
  void initState() {
    super.initState();
  }

  void _expandParentWorkspaces(DeskState state, String workspaceName) {
    // Find the workspace
    final workspace = state.workspaces
        ?.where(
          (w) => w.name == workspaceName,
        )
        .firstOrNull;

    // If workspace not found or has no parent, return
    if (workspace == null ||
        workspace.parentPage == null ||
        workspace.parentPage!.isEmpty) {
      return;
    }

    // Add parent to expanded set
    _expandedWorkspaces.add(workspace.parentPage!);

    // Recursively expand parent's parent (but avoid infinite loops)
    if (workspace.parentPage != workspaceName) {
      _expandParentWorkspaces(state, workspace.parentPage!);
    }
  }

  @override
  void dispose() {
    notificationsPopoverController.dispose();
    helpPopoverController.dispose();
    profilePopoverController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final responsive = ResponsiveBreakpoints.of(context);

    return BlocBuilder<DeskBloc, DeskState>(
      builder: (context, state) {
        return Scaffold(
          drawer: !responsive.isDesktop
              ? _buildMobileDrawer(context, state, theme)
              : null,
          body: SafeArea(
            child: Column(
              children: [
                _buildAppBar(context, state, theme, responsive),
                if (state.currentPage?.name != null)
                  _buildWorkspaceHeader(context, state, theme, responsive),
                _buildMainContent(context, state, theme, responsive),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileDrawer(
    BuildContext context,
    DeskState state,
    ShadThemeData theme,
  ) {
    return NavigationDrawer(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
        if (state.workspaces != null && index < state.workspaces!.length) {
          context.read<DeskBloc>().add(
            LoadPageEvent(
              name: state.workspaces![index].name!,
              type: 'Workspace',
            ),
          );
        }
        Navigator.pop(context);
      },
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 28, 16, 16),
          child: Text('Menu', style: theme.textTheme.h4),
        ),
        if (state.workspaces != null)
          ..._buildMobileWorkspaceItems(context, state, theme, 0)
        else
          ...List.generate(
            10,
            (index) => const NavigationDrawerDestination(
              icon: Icon(Icons.dashboard_outlined),
              label: Text('Loading...'),
            ),
          ),
      ],
    );
  }

  List<Widget> _buildMobileWorkspaceItems(
    BuildContext context,
    DeskState state,
    ShadThemeData theme,
    int level,
  ) {
    final rootWorkspaces = state.workspaces!
        .where((w) => w.parentPage == '')
        .toList();
    final items = <Widget>[];

    for (final workspace in rootWorkspaces) {
      final children = state.workspaces!
          .where((w) => w.parentPage == workspace.name)
          .toList();
      final isExpanded = _expandedWorkspaces.contains(workspace.name);
      final hasChildren = children.isNotEmpty;
      final isActive =
          workspace.name == state.currentPage?.name &&
          state.currentPage?.type == 'Workspace';

      // Add workspace item
      items.add(
        Padding(
          padding: EdgeInsets.only(left: level * 20), // Increased indentation
          child: ListTile(
            leading: Icon(
              isActive ? Icons.dashboard : Icons.dashboard_outlined,
              color: isActive ? theme.colorScheme.primary : null,
            ),
            trailing: hasChildren
                ? IconButton(
                    icon: AnimatedRotation(
                      turns: isExpanded ? 0.25 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(Icons.chevron_right),
                    ),
                    onPressed: () {
                      setState(() {
                        if (isExpanded) {
                          _expandedWorkspaces.remove(workspace.name);
                        } else {
                          _expandedWorkspaces.add(workspace.name!);
                        }
                      });
                    },
                  )
                : null,
            title: Text(
              workspace.label ?? 'Unknown',
              style: theme.textTheme.p.copyWith(
                color: isActive ? theme.colorScheme.primary : null,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            tileColor: isActive
                ? theme.colorScheme.primary.withValues(alpha: 0.1)
                : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: isActive
                  ? BorderSide(color: theme.colorScheme.primary)
                  : BorderSide.none,
            ),
            onTap: () {
              // Expand parent workspaces when selecting a workspace
              _expandParentWorkspaces(state, workspace.name!);
              context.read<DeskBloc>().add(
                LoadPageEvent(name: workspace.name!, type: 'Workspace'),
              );
              Navigator.pop(context);
            },
          ),
        ),
      );

      // Add child workspaces if expanded
      if (hasChildren && isExpanded) {
        for (final child in children) {
          final childChildren = state.workspaces!
              .where((w) => w.parentPage == child.name)
              .toList();
          final childIsExpanded = _expandedWorkspaces.contains(child.name);
          final childHasChildren = childChildren.isNotEmpty;
          final childIsActive = child.name == state.currentPage?.name;

          items.add(
            Padding(
              padding: EdgeInsets.only(
                left: (level + 1) * 20,
              ), // Increased indentation
              child: ListTile(
                leading: childHasChildren
                    ? IconButton(
                        icon: AnimatedRotation(
                          turns: childIsExpanded ? 0.25 : 0,
                          duration: const Duration(milliseconds: 200),
                          child: const Icon(Icons.chevron_right),
                        ),
                        onPressed: () {
                          setState(() {
                            if (childIsExpanded) {
                              _expandedWorkspaces.remove(child.name);
                            } else {
                              _expandedWorkspaces.add(child.name!);
                            }
                          });
                        },
                      )
                    : Icon(
                        childIsActive
                            ? Icons.dashboard
                            : Icons.dashboard_outlined,
                        color: childIsActive ? theme.colorScheme.primary : null,
                      ),
                title: Text(
                  child.label ?? 'Unknown',
                  style: theme.textTheme.p.copyWith(
                    color: childIsActive ? theme.colorScheme.primary : null,
                    fontWeight: childIsActive
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
                tileColor: childIsActive
                    ? theme.colorScheme.primary.withValues(alpha: 0.1)
                    : null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: childIsActive
                      ? BorderSide(color: theme.colorScheme.primary)
                      : BorderSide.none,
                ),
                onTap: () {
                  // Expand parent workspaces when selecting a child
                  _expandParentWorkspaces(state, child.name!);
                  context.read<DeskBloc>().add(
                    LoadPageEvent(name: child.name!, type: 'Workspace'),
                  );
                  Navigator.pop(context);
                },
              ),
            ),
          );

          // Add grandchild workspaces if expanded (limit to 2 levels for mobile)
          if (childHasChildren && childIsExpanded && level < 1) {
            for (final grandchild in childChildren) {
              final grandchildIsActive =
                  grandchild.name == state.currentPage?.name;

              items.add(
                Padding(
                  padding: EdgeInsets.only(
                    left: (level + 2) * 20,
                  ), // Increased indentation
                  child: ListTile(
                    leading: Icon(
                      grandchildIsActive
                          ? Icons.dashboard
                          : Icons.dashboard_outlined,
                      color: grandchildIsActive
                          ? theme.colorScheme.primary
                          : null,
                    ),
                    title: Text(
                      grandchild.label ?? 'Unknown',
                      style: theme.textTheme.p.copyWith(
                        color: grandchildIsActive
                            ? theme.colorScheme.primary
                            : null,
                        fontWeight: grandchildIsActive
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                    tileColor: grandchildIsActive
                        ? theme.colorScheme.primary.withValues(alpha: 0.1)
                        : null,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: grandchildIsActive
                          ? BorderSide(
                              color: theme.colorScheme.primary,
                            )
                          : BorderSide.none,
                    ),
                    onTap: () {
                      // Expand parent workspaces when selecting a grandchild
                      _expandParentWorkspaces(state, grandchild.name!);
                      context.read<DeskBloc>().add(
                        LoadPageEvent(
                          name: grandchild.name!,
                          type: 'Workspace',
                        ),
                      );
                      Navigator.pop(context);
                    },
                  ),
                ),
              );
            }
          }
        }
      }
    }

    return items;
  }

  Widget _buildAppBar(
    BuildContext context,
    DeskState state,
    ShadThemeData theme,
    ResponsiveBreakpointsData responsive,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.colorScheme.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildLogo(theme),
              const HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                color: Colors.grey,
              ),
              Text(state.currentPage?.type ?? ''),
              const HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                color: Colors.grey,
              ),
              Text(state.currentPage?.name ?? ''),
            ],
          ),
          _buildAppBarActions(context, state, theme, responsive),
        ],
      ),
    );
  }

  Widget _buildLogo(ShadThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SvgPicture.asset(
        'assets/images/frappe.svg',
        colorFilter: ColorFilter.mode(
          theme.colorScheme.primary,
          BlendMode.srcIn,
        ),
        width: 30,
        height: 30,
        semanticsLabel: 'Frappe Logo',
      ),
    );
  }

  Widget _buildAppBarActions(
    BuildContext context,
    DeskState state,
    ShadThemeData theme,
    ResponsiveBreakpointsData responsive,
  ) {
    return Row(
      children: [
        _buildNotificationsPopover(context, theme),
        _buildDivider(theme),
        if (responsive.isDesktop) _buildHelpPopover(context, theme),
        _buildProfilePopover(context, state, theme),
        const SizedBox(width: 16),
      ],
    );
  }

  Widget _buildNotificationsPopover(BuildContext context, ShadThemeData theme) {
    return ShadPopover(
      controller: notificationsPopoverController,
      popover: (context) => _buildNotificationsContent(theme),
      child: ShadButton.ghost(
        onPressed: notificationsPopoverController.toggle,
        hoverBackgroundColor: Colors.transparent,
        child: Badge(
          // label: const Text('3'),
          child: Icon(
            Icons.notifications_outlined,
            color: theme.colorScheme.foreground,
            semanticLabel: 'Notifications',
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationsContent(ShadThemeData theme) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Notifications', style: theme.textTheme.h4),
          ),
          const Divider(),
          const SizedBox(height: 50),
          Center(
            child: Text(
              'No new notifications',
              style: theme.textTheme.small,
            ),
          ),
          const SizedBox(height: 50),
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemCount: 3,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       leading: CircleAvatar(
          //         backgroundColor: theme.colorScheme.primary.withValues(
          //           alpha: 0.1,
          //         ),
          //         child: Icon(
          //           Icons.notifications_outlined,
          //           color: theme.colorScheme.primary,
          //         ),
          //       ),
          //       title: Text('Notification ${index + 1}'),
          //       subtitle: Text('This is notification ${index + 1}'),
          //       trailing: Text(
          //         '2m ago',
          //         style: theme.textTheme.small.copyWith(
          //           color: theme.colorScheme.foreground,
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildDivider(ShadThemeData theme) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 8),
        Divider(height: 24, color: theme.colorScheme.foreground),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildHelpPopover(BuildContext context, ShadThemeData theme) {
    return ShadPopover(
      controller: helpPopoverController,
      popover: (context) => _buildHelpContent(theme),
      child: ShadButton.ghost(
        onPressed: helpPopoverController.toggle,
        hoverBackgroundColor: Colors.transparent,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Help', style: theme.textTheme.small),
            const SizedBox(width: 8),
            Icon(Icons.chevron_right, color: theme.colorScheme.foreground),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpContent(ShadThemeData theme) {
    final helpItems = [
      'Documentation',
      'User Forum',
      'Frappe School',
      'Report an Issue',
      'About',
      'Keyboard Shortcuts',
      'Frappe Support',
    ];

    return SizedBox(
      width: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: helpItems
            .map(
              (item) => ShadButton.ghost(
                child: Text(
                  item,
                  style: TextStyle(color: theme.colorScheme.foreground),
                ),
                onPressed: () => _showComingSoonDialog(context),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildProfilePopover(
    BuildContext context,
    DeskState state,
    ShadThemeData theme,
  ) {
    return ShadPopover(
      controller: profilePopoverController,
      popover: (context) => _buildProfileContent(context, theme),
      child: ShadButton.ghost(
        onPressed: profilePopoverController.toggle,
        hoverBackgroundColor: Colors.transparent,
        child: ShadAvatar(
          'https://app.requestly.io/delay/2000/avatars.githubusercontent.com/u/1d24599?v=4',
          placeholder: Text(
            getInitials(state.username ?? ''),
            semanticsLabel: 'User avatar',
          ),
        ),
      ),
    );
  }

  Widget _buildProfileContent(BuildContext context, ShadThemeData theme) {
    final responsive = ResponsiveBreakpoints.of(context);
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProfileMenuItem(
            'My Profile',
            () => _showComingSoonDialog(context),
            theme,
          ),
          _buildProfileMenuItem(
            'My Settings',
            () => _showComingSoonDialog(context),
            theme,
          ),
          _buildProfileMenuItem(
            'Session Defaults',
            () => _showComingSoonDialog(context),
            theme,
          ),
          _buildProfileMenuItem(
            'Reload',
            () => _showComingSoonDialog(context),
            theme,
          ),
          _buildProfileMenuItem(
            'Apps',
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AppsPage()),
            ),
            theme,
          ),
          if (responsive.isDesktop)
            _buildProfileMenuItem('Toggle Full Width', () {
              setState(() {
                fullWidth = !fullWidth;
                profilePopoverController.toggle();
              });
            }, theme),
          _buildProfileMenuItem(
            'Toggle Theme',
            () => _showThemeDialog(context),
            theme,
          ),
          const Divider(),
          _buildProfileMenuItem('Logout', () {
            context.read<DeskBloc>().add(LogoutEvent(context: context));
          }, theme),
        ],
      ),
    );
  }

  Widget _buildProfileMenuItem(
    String label,
    VoidCallback onPressed,
    ShadThemeData theme,
  ) {
    return ShadButton.ghost(
      onPressed: onPressed,
      child: Text(label, style: TextStyle(color: theme.colorScheme.foreground)),
    );
  }

  void _showThemeDialog(BuildContext context) {
    profilePopoverController.toggle();
    showShadDialog<void>(context: context, builder: _buildThemeDialog);
  }

  void _showComingSoonDialog(BuildContext context) {
    showShadDialog<void>(context: context, builder: _buildComingSoonDialog);
  }

  Widget _buildThemeDialog(BuildContext context) {
    final theme = ShadTheme.of(context);
    final themeOptions = [
      {
        'name': 'Frappe Light',
        'mode': ThemeMode.light,
        'icon': Icons.light_mode,
      },
      {
        'name': 'Timeless Night',
        'mode': ThemeMode.dark,
        'icon': Icons.dark_mode,
      },
      {'name': 'Automatic', 'mode': ThemeMode.system, 'icon': Icons.settings},
    ];

    return ShadDialog(
      title: const Text('Switch Theme'),
      child: Center(
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          children: themeOptions
              .map(
                (option) => Card(
                  child: InkWell(
                    onTap: () {
                      context.read<SettingsBloc>().add(
                        ThemeChangedEvent(
                          themeMode: option['mode']! as ThemeMode,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            option['icon']! as IconData,
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            option['name']! as String,
                            style: theme.textTheme.small,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildComingSoonDialog(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadDialog(
      title: const Text('Coming Soon'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.construction,
            size: 48,
            color: theme.colorScheme.primary,
          ),
          const SizedBox(height: 16),
          Text(
            'This feature is under development and will be available soon!',
            style: theme.textTheme.p,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ShadButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkspaceHeader(
    BuildContext context,
    DeskState state,
    ShadThemeData theme,
    ResponsiveBreakpointsData responsive,
  ) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        !fullWidth && responsive.largerOrEqualTo(DESKTOP) ? 100 : 0,
        0,
        !fullWidth && responsive.largerOrEqualTo(DESKTOP) ? 100 : 0,
        0,
      ),
      child: Row(
        children: [
          Builder(
            builder: (context) => ShadButton.ghost(
              onPressed: () {
                if (responsive.isDesktop) {
                  setState(() {
                    _isSidebarOpen = !_isSidebarOpen;
                  });
                } else {
                  Scaffold.of(context).openDrawer();
                }
              },
              child: const Icon(Icons.menu, semanticLabel: 'Toggle menu'),
            ),
          ),
          const SizedBox(width: 5),
          if (state.currentPage?.name != null)
            Text(state.currentPage!.name!, style: theme.textTheme.h4)
          else
            const ShimmerContainer(width: 200, height: 24),
        ],
      ),
    );
  }

  Widget _buildMainContent(
    BuildContext context,
    DeskState state,
    ShadThemeData theme,
    ResponsiveBreakpointsData responsive,
  ) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          !fullWidth && responsive.largerOrEqualTo(DESKTOP) ? 100 : 0,
          0,
          !fullWidth && responsive.largerOrEqualTo(DESKTOP) ? 100 : 0,
          0,
        ),
        child: Row(
          children: [
            if (responsive.isDesktop)
              _buildDesktopSidebar(context, state, theme),

            BlocBuilder<DeskBloc, DeskState>(
              builder: (context, state) {
                if (state.currentPage == null) {
                  return const Expanded(
                    child: Center(
                      child: Text('No page selected'),
                    ),
                  );
                }

                if (state.currentPage!.type == 'Workspace') {
                  return Expanded(
                    child: WorkspacePage(
                      name: state.currentPage!.name ?? '',
                    ),
                  );
                }

                if (state.currentPage!.type == 'Dashboard') {
                  return Expanded(
                    child: DashboardPage(
                      name: state.currentPage!.name ?? '',
                    ),
                  );
                }

                return const Expanded(
                  child: Center(
                    child: Text('No page selected'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopSidebar(
    BuildContext context,
    DeskState state,
    ShadThemeData theme,
  ) {
    if (!_isSidebarOpen) return const SizedBox.shrink();

    return Container(
      width: 240,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: theme.colorScheme.border)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.workspaces != null)
              ...state.workspaces!.where((w) => w.parentPage == '').map((
                workspace,
              ) {
                final children = state.workspaces!
                    .where((w) => w.parentPage == workspace.name)
                    .toList();
                return _buildWorkspaceItem(
                  context,
                  workspace,
                  theme,
                  state,
                  children,
                  0, // Level 0 for root workspaces
                );
              })
            else
              ...List.generate(
                30,
                (index) => _buildWorkspaceItemShimmer(theme),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkspaceItem(
    BuildContext context,
    dynamic workspace,
    ShadThemeData theme,
    DeskState state,
    List<dynamic> children,
    int level,
  ) {
    final workspaceName = workspace.name?.toString();
    final isActive =
        workspace.name == state.currentPage?.name &&
        state.currentPage?.type == 'Workspace';
    final isExpanded = _expandedWorkspaces.contains(workspaceName);
    final hasChildren = children.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.only(
            left:
                8 + (level * 24), // Increased indentation for better hierarchy
            right: 8,
            top: 2,
            bottom: 2,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? theme.colorScheme.primary.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: isActive
                ? Border.all(color: theme.colorScheme.primary)
                : null,
          ),
          child: ShadButton.ghost(
            onPressed: () {
              if (workspaceName != null) {
                // Expand parent workspaces when selecting a child
                _expandParentWorkspaces(state, workspaceName);
                context.read<DeskBloc>().add(
                  LoadPageEvent(name: workspaceName, type: 'Workspace'),
                );
              }
            },
            hoverBackgroundColor: isActive
                ? theme.colorScheme.primary.withValues(alpha: 0.15)
                : null,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Workspace icon
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    key: ValueKey(isActive),
                    isActive ? Icons.dashboard : Icons.dashboard_outlined,
                    size: 16,
                    color: isActive
                        ? theme.colorScheme.primary
                        : theme.colorScheme.foreground,
                  ),
                ),
                const SizedBox(width: 8),

                // Workspace label
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        workspace.label?.toString() ?? 'Unknown',
                        style: theme.textTheme.p.copyWith(
                          color: isActive
                              ? theme.colorScheme.primary
                              : theme.colorScheme.foreground,
                          fontWeight: isActive
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),

                // Expand/collapse button for workspaces with children
                if (hasChildren)
                  ShadButton.ghost(
                    onPressed: () {
                      setState(() {
                        if (isExpanded) {
                          _expandedWorkspaces.remove(workspaceName);
                        } else {
                          _expandedWorkspaces.add(workspaceName!);
                        }
                      });
                    },
                    child: AnimatedRotation(
                      turns: isExpanded ? 0.25 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.chevron_right,
                        size: 16,
                        color: theme.colorScheme.foreground,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),

        // Child workspaces with proper indentation and visual connectors
        if (hasChildren && isExpanded)
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: Column(
              children: children.asMap().entries.map((entry) {
                final index = entry.key;
                final child = entry.value;
                final childChildren = state.workspaces!
                    .where((w) => w.parentPage == child.name)
                    .toList();
                final isLastChild = index == children.length - 1;

                return Column(
                  children: [
                    // Visual connector line for child items
                    // if (!isLastChild)
                    //   Container(
                    //     margin: EdgeInsets.only(
                    //       left: 8 + (level * 24) + 12, // Align with child items
                    //     ),
                    //     width: 2,
                    //     height: 8,
                    //     decoration: BoxDecoration(
                    //       color: theme.colorScheme.border,
                    //       borderRadius: BorderRadius.circular(1),
                    //     ),
                    //   ),
                    _buildWorkspaceItem(
                      context,
                      child,
                      theme,
                      state,
                      childChildren,
                      level + 1,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  Widget _buildWorkspaceItemShimmer(ShadThemeData theme) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          ShimmerContainer(width: 40, height: 40),
          SizedBox(width: 8),
          Expanded(child: ShimmerContainer(width: double.infinity, height: 40)),
        ],
      ),
    );
  }
}

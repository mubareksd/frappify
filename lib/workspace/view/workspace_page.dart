import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frappe_client/frappe_client.dart';
import 'package:frappify/desk/desk.dart' as desk;
import 'package:frappify/number_card/view/number_card_page.dart';
import 'package:frappify/workspace/workspace.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WorkspacePage extends StatefulWidget {
  const WorkspacePage({
    required this.name,
    super.key,
  });

  final String name;

  @override
  State<WorkspacePage> createState() => _WorkspacePageState();
}

class _WorkspacePageState extends State<WorkspacePage> {
  late final WorkspaceBloc _bloc;
  late final desk.DeskBloc _deskBloc;

  @override
  void initState() {
    super.initState();
    _bloc = WorkspaceBloc(
      frappe: context.read<FrappeClient>(),
    );

    _deskBloc = context.read<desk.DeskBloc>();

    if (widget.name.trim().isNotEmpty) {
      _bloc.add(LoadWorkspaceEvent(name: widget.name));
    }
  }

  @override
  void didUpdateWidget(covariant WorkspacePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.name != widget.name && widget.name.trim().isNotEmpty) {
      _bloc.add(LoadWorkspaceEvent(name: widget.name));
    }
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.name.trim().isEmpty) {
      return const _WorkspacePlaceholder();
    }

    return BlocProvider.value(
      value: _bloc,
      child: const WorkspaceView(),
    );
  }
}

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return BlocBuilder<WorkspaceBloc, WorkspaceState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: state.isLoadingWorkspace
                ? _buildContentSkeleton(theme)
                : state.workspace != null
                ? Column(
                    key: ValueKey(state.workspace),
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.workspace?.charts?.items?.isNotEmpty ?? false)
                        _buildChartsSection(context, state, theme),
                      if (state.workspace?.numberCards?.items?.isNotEmpty ??
                          false)
                        _buildNumberCardsSection(context, state, theme),
                      if (state.workspace?.shortcuts?.items?.isNotEmpty ??
                          false)
                        _buildShortcutsSection(context, state, theme),
                      if (state.workspace?.cards?.items?.isNotEmpty ?? false)
                        _buildCardsSection(context, state, theme),
                    ],
                  )
                : _buildContentSkeleton(theme),
          ),
        );
      },
    );
  }

  Widget _buildContentSkeleton(ShadThemeData theme) {
    return Skeletonizer(
      containersColor: theme.colorScheme.muted.withValues(alpha: 0.25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 24,
            decoration: BoxDecoration(
              color: theme.colorScheme.card,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              6,
              (index) => Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: theme.colorScheme.card,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Container(
            width: 180,
            height: 24,
            decoration: BoxDecoration(
              color: theme.colorScheme.card,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              8,
              (index) => Container(
                width: 200,
                height: 120,
                decoration: BoxDecoration(
                  color: theme.colorScheme.card,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartsSection(
    BuildContext context,
    WorkspaceState state,
    ShadThemeData theme,
  ) {
    return Container();
  }

  Widget _buildNumberCardsSection(
    BuildContext context,
    WorkspaceState state,
    ShadThemeData theme,
  ) {
    return ResponsiveGridList(
      minItemWidth: 300,
      maxItemsPerRow: 4,
      listViewBuilderOptions: ListViewBuilderOptions(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
      children: state.workspace!.numberCards!.items!.map((entry) {
        return NumberCardPage(
          name: entry.label ?? '',
        );
      }).toList(),
    );
  }

  Widget _buildShortcutsSection(
    BuildContext context,
    WorkspaceState state,
    ShadThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Shortcuts', style: theme.textTheme.h3),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: (state.workspace?.shortcuts?.items ?? [])
              .map((shortcut) => _buildShortcutCard(shortcut, theme, context))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildShortcutCard(
    dynamic shortcut,
    ShadThemeData theme,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () {
        if (shortcut.type == 'Doctype') {
          BlocProvider.of<desk.DeskBloc>(context).add(
            desk.LoadPageEvent(
              type: 'Doctype',
              name: shortcut.linkTo as String,
            ),
          );
        } else if (shortcut.type == 'Report') {
          BlocProvider.of<desk.DeskBloc>(context).add(
            desk.LoadPageEvent(
              type: 'Report',
              name: shortcut.linkTo as String,
            ),
          );
        } else if (shortcut.type == 'Dashboard') {
          BlocProvider.of<desk.DeskBloc>(context).add(
            desk.LoadPageEvent(
              type: 'Dashboard',
              name: shortcut.linkTo as String,
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              shortcut.label?.toString() ?? 'Unknown',
              style: theme.textTheme.small,
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_outward, color: theme.colorScheme.primary),
          ],
        ),
      ),
    );
  }

  Widget _buildCardsSection(
    BuildContext context,
    WorkspaceState state,
    ShadThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text('Reports & Masters', style: theme.textTheme.h3),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: (state.workspace?.cards?.items ?? [])
              .map((card) => _buildCardItem(card, theme))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildCardItem(dynamic card, ShadThemeData theme) {
    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              card.label?.toString() ?? 'Unknown',
              style: theme.textTheme.h4,
            ),
            const SizedBox(height: 12),
            if (card.links != null)
              ...(card.links as List<dynamic>).map(
                (link) => _buildLinkItem(link, theme),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLinkItem(dynamic link, ShadThemeData theme) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.link,
              size: 16,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                link.label?.toString() ?? 'Unknown',
                style: theme.textTheme.small.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WorkspacePlaceholder extends StatelessWidget {
  const _WorkspacePlaceholder();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Skeletonizer(
        containersColor: theme.colorScheme.muted.withValues(alpha: 0.25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 150,
              height: 24,
              decoration: BoxDecoration(
                color: theme.colorScheme.card,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              height: 120,
              decoration: BoxDecoration(
                color: theme.colorScheme.card,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum GitRepositoryProvider { unknow, github }

class RepositoryEntity {
  final GitRepositoryProvider provider;
  final String organizationName;
  final String projectName;

  RepositoryEntity({
    required this.provider,
    required this.organizationName,
    required this.projectName,
  });

  factory RepositoryEntity.empty() {
    return EmptyRepositoryEntity();
  }
}

class EmptyRepositoryEntity extends RepositoryEntity {
  EmptyRepositoryEntity()
      : super(
          provider: GitRepositoryProvider.unknow,
          organizationName: '',
          projectName: '',
        );
}

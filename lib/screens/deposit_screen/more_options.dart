class MoreOption {
  String image;
  String title;
  String subtitle;
  Function()? onTap;

  MoreOption({
    required this.image,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
}

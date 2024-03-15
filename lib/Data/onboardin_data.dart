

class PageData {
  PageData( this.onBordinTitle, this.imageUrl);
  final String? onBordinTitle;
  final String? imageUrl;
  static List<PageData> genaratePageDataList() {
    return [
      PageData( 'Update Progress Your Work for The Team',
          'assets/images/background1.jpeg'),
      PageData( 'Create a Task and Assign it to Your Team Members',
          'assets/images/background2.jpeg'),
      PageData( 'Get Notified when you Get a New Assignment',
          'assets/images/background4.jpeg'),
    ];
  }
}

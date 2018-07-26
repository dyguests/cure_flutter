class Photo {
/*  {
  photo: {
  id: 6551257,
  url: "/photo/6551257",
  subject: "双黒",
  sq150_url: "https://wc-ahba9see.c.sakurastorage.jp/469922/rjprqluawpxfuotgrjxldhmathkvhedofjwgnvoe-350x600.jpg",
  sq300_url: "https://wc-ahba9see.c.sakurastorage.jp/469922/rjprqluawpxfuotgrjxldhmathkvhedofjwgnvoe-350x600.jpg",
  does_like: false,
  liked: false,
  is_owner: false,
  viewable: true
  }
  }*/

  final int id;
  final String url;
  final String subject;
  final String sq150_url;
  final String sq300_url;
  final bool does_like;
  final bool liked;
  final bool is_owner;
  final bool viewable;
}

class PhotoWrap {
  final Photo photo;
}

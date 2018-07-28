///封面
///
/// 图片列表中图片的信息
class Cover {
  final Character character;
  final Member member;
  final Photo photo;

  Cover({this.character, this.member, this.photo});
}

class Character {
//    name: "Kurumi Tokisaki"
}

class Member {
//id: 23345,
//global_name: "Mon",
//nickname: "Mon❥小夢夢",
//nickname_with_fallback: "Mon❥小夢夢",
//icon_url: "https://wc-ahba9see.c.sakurastorage.jp/23345/125804a54881e17c1b70bf7efe6ab54f793e4974-100.jpg",
//url: "/member/monpink/",
//myself: false,
//national_flag_url: "/img/flags/tw.gif"
}

class Photo {
  final int id; // 2419647,
  final String subject; // "Kurumi Tokisaki",
  final String url; // "/photo/2419647",
//thumbnail_url_display: "https://wc-ahba9see.c.sakurastorage.jp/23345/ukwlmmfuqxzviaqyfnemievicnlavlbbwgzibqrz-175.jpg",
//thumbnail_width: 175,
//thumbnail_height: 116,
  final String sq150_url; // "https://wc-ahba9see.c.sakurastorage.jp/23345/ukwlmmfuqxzviaqyfnemievicnlavlbbwgzibqrz-350x600.jpg",
  final String sq300_url; // "https://wc-ahba9see.c.sakurastorage.jp/23345/ukwlmmfuqxzviaqyfnemievicnlavlbbwgzibqrz-350x600.jpg",
  final String large_url; // "https://wc-ahba9see.c.sakurastorage.jp/23345/ukwlmmfuqxzviaqyfnemievicnlavlbbwgzibqrz-740.jpg",
//is_small: false,
//orientation: "landscape",
//weekly_view_cnt: "12",
//monthly_view_cnt: "48",
//weekly_good_cnt: "0",
//monthly_good_cnt: "1",
//good_cnt: "2942",
//viewable: true,
//created_at: "2014-10-02 20:26"

  Photo({this.id, this.subject, this.url, this.sq150_url, this.sq300_url, this.large_url});
}

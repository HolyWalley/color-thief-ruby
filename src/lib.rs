#[macro_use]
extern crate rutie;

extern crate image;
extern crate color_thief;

use std::path;
use color_thief::ColorFormat;
use rutie::{Class, Object, RString, VM, Array, Hash, Symbol, Fixnum};

fn find_color(t: image::ColorType) -> ColorFormat {
    match t {
        image::ColorType::Rgb8 => ColorFormat::Rgb,
        image::ColorType::Rgba8 => ColorFormat::Rgba,
        _ => unreachable!(),
    }
}

class!(ColorThiefRuby);

methods!(
    ColorThiefRuby,
    _rtself,

    fn pub_pallete(input: RString) -> Array {
        let file_path = input.
          map_err(|e| VM::raise_ex(e) ).
          unwrap().
          to_string();

        let img = image::open(&path::Path::new(&file_path)).unwrap();
        let color_type = find_color(img.color());
        let colors = color_thief::get_palette(&img.as_bytes().to_vec(), color_type, 10, 10).unwrap();

        let mut response = Array::new();

        for color in colors.iter() {
            let mut ruby_color = Hash::new();

            ruby_color.store(Symbol::new("r"), Fixnum::new(i64::from(color.r)));
            ruby_color.store(Symbol::new("g"), Fixnum::new(i64::from(color.g)));
            ruby_color.store(Symbol::new("b"), Fixnum::new(i64::from(color.b)));

            response.push(ruby_color);
        }

        response
    }
);

#[allow(non_snake_case)]
#[no_mangle]
pub extern "C" fn Init_color_thief_ruby() {
    Class::new("ColorThief", None).define(|klass| {
        klass.def_self("pallete", pub_pallete);
    });
}

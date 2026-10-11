// Kiểu cho web component <sava-bar> (https://www.savafinlab.com.vn/brand/v2/sava-bar.js)
import "react";
declare module "react" {
  namespace JSX {
    interface IntrinsicElements {
      "sava-bar": React.DetailedHTMLProps<React.HTMLAttributes<HTMLElement>, HTMLElement> & { product?: string };
    }
  }
}

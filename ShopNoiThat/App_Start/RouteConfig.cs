using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace ShopNoiThat
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                name: "Tu van thiet ke",
                url: "thiet-ke-noi-that",
                defaults: new { controller = "Project", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "ShopNoiThat.Controllers" }
            );
            routes.MapRoute(
                name: "San pham theo loai",
                url: "{metatitle}-{id}",
                defaults: new { controller = "Product", action = "Category", id = UrlParameter.Optional },
                namespaces: new[] { "ShopNoiThat.Controllers" }
            );
            routes.MapRoute(
                name: "Chi tiet du an",
                url: "thiet-ke/{metatitle}-{id}",
                defaults: new { controller = "Project", action = "DetailProject", id = UrlParameter.Optional },
                namespaces: new[] { "ShopNoiThat.Controllers" }
            );
            routes.MapRoute(
                name: "Chi tiet bai viet",
                url: "bai-viet/{metatitle}-{id}",
                defaults: new { controller = "News", action = "DetailNews", id = UrlParameter.Optional },
                namespaces: new[] { "ShopNoiThat.Controllers" }
            );
            routes.MapRoute(
                name: "Bai viet theo chu de",
                url: "tu-van/{metatitle}-{id}",
                defaults: new { controller = "News", action = "Category", id = UrlParameter.Optional },
                namespaces: new[] { "ShopNoiThat.Controllers" }
            );
            routes.MapRoute(
                name: "Blog tu van",
                url: "blog-tu-van",
                defaults: new { controller = "News", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "ShopNoiThat.Controllers" }
            );
            routes.MapRoute(
                name: "Tim kiem",
                url: "tim-kiem",
                defaults: new { controller = "Product", action = "Search", id = UrlParameter.Optional },
                namespaces: new[] { "ShopNoiThat.Controllers" }
            );
            routes.MapRoute(
                name: "Product Detail",
                url: "chi-tiet/{metatitle}-{id}",
                defaults: new { controller = "Product", action = "Detail", id = UrlParameter.Optional },
                namespaces: new[] { "ShopNoiThat.Controllers" }
            );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new string[] { "ShopNoiThat.Controllers" }
            );
        }
    }
}

using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ShopNoiThat.Startup))]
namespace ShopNoiThat
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
        }
    }
}

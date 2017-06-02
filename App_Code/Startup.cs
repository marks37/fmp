using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Saturation.Startup))]
namespace Saturation
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}

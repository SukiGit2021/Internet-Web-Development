using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(week3_studio.Startup))]
namespace week3_studio
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}

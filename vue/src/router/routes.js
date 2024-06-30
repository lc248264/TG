import AdminRoutes from "./admin-routes";

const routes = [
    {
        path: "/",
        name: "Home",
        redirect: "/admin/sy",
    },
    {
        path: "/login",
        name: "Login",
        component: () => import("@/views/login/index.vue"),
        meta: { title: "系统登录" },
    },
    {
        path: "/admin",
        name: "Admin",
        component: () => import("@/views/admin/index.vue"),
        redirect: "/login",
        meta: { title: "后台管理", authLogin: true },
        children: [
            {
                path: "sy",
                name: "AdminSy",
                component: () => import("@/views/admin/sy.vue"),
                meta: { authLogin: true, title: "欢迎页", affix: true },
            },
            {
                path: "mod",
                name: "AdminMod",
                component: () => import("@/views/admin/mod.vue"),
                meta: { authLogin: true, title: "修改密码" },
            },
            ...AdminRoutes,
        ],
    },
];

export default routes;

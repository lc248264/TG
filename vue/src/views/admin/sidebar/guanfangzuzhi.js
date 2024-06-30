export default [
    {
        label: "个人中心",
        to: "",
        children: [
            {
                label: "修改个人资料",
                to: { path: "/admin/guanfangzuzhi/updtself" },
            },
            {
                label: "修改密码",
                to: { path: "/admin/mod" },
            },
        ],
    },
    {
        label: "组织信息管理",
        to: "",
        children: [
            {
                label: "组织信息添加",
                to: { path: "/admin/zuzhixinxi/add" },
            },
            {
                label: "组织信息查询",
                to: { path: "/admin/zuzhixinxi/chuangjianren" },
            },
            {
                label: "组织审核查询",
                to: { path: "/admin/zuzhishenhe/chuangjianren" },
            },
        ],
    },
    {
        label: "入组申请管理",
        to: "",
        children: [
            {
                label: "入组申请查询",
                to: { path: "/admin/ruzushenqing/chuangjianren" },
            },
            {
                label: "入组审核查询",
                to: { path: "/admin/ruzushenhe/chuangjianren" },
            },
        ],
    },
    {
        label: "组织活动管理",
        to: "",
        children: [
            {
                label: "组织活动查询",
                to: { path: "/admin/zuzhihuodong/chuangjianren" },
            },
            {
                label: "活动审核查询",
                to: { path: "/admin/huodongshenhe/chuangjianren" },
            },
        ],
    },
    {
        label: "活动申请管理",
        to: "",
        children: [
            {
                label: "活动申请查询",
                to: { path: "/admin/huodongshenqing/chuangjianren" },
            },
            {
                label: "审核申请查询",
                to: { path: "/admin/shenheshenqing/chuangjianren" },
            },
        ],
    },
    {
        label: "结算志愿管理",
        to: "",
        children: [
            {
                label: "结算志愿查询",
                to: { path: "/admin/jiesuanzhiyuan/chuangjianren" },
            },
            {
                label: "结算审核查询",
                to: { path: "/admin/jiesuanshenhe/chuangjianren" },
            },
        ],
    },
    {
        label: "志愿墙管理",
        to: "",
        children: [
            {
                label: "志愿墙发布",
                to: { path: "/admin/zhiyuanqiang/add" },
            },
            {
                label: "志愿墙查询",
                to: { path: "/admin/zhiyuanqiang/faburen" },
            },
        ],
    },
    {
        label: "志愿时刻管理",
        to: "",
        children: [
            {
                label: "帖子发布",
                to: { path: "/admin/tiezi/add" },
            },

            {
                label: "帖子查询",
                to: { path: "/admin/tiezi/faburen" },
            },

        ],
    },
];

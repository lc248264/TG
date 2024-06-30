export default [
    {
        label: "账号管理",
        to: "",
        children: [
            {
                label: "管理员账号管理",
                to: { path: "/admin/admins" },
            },
            {
                label: "管理员账号添加",
                to: { path: "/admin/admins/add" },
            },
            {
                label: "密码修改",
                to: { path: "/admin/mod" },
            },
        ],
    },
    {
        label: "官方组织管理",
        to: "",
        children: [
            {
                label: "官方组织添加",
                to: { path: "/admin/guanfangzuzhi/add" },
            },
            {
                label: "官方组织查询",
                to: { path: "/admin/guanfangzuzhi" },
            },
        ],
    },
    {
        label: "志愿者管理",
        to: "",
        children: [
            {
                label: "志愿者添加",
                to: { path: "/admin/zhiyuanzhe/add" },
            },
            {
                label: "志愿者查询",
                to: { path: "/admin/zhiyuanzhe" },
            },
        ],
    },
    {
        label: "地区管理",
        to: "",
        children: [
            {
                label: "地区添加",
                to: { path: "/admin/diqu/add" },
            },
            {
                label: "地区查询",
                to: { path: "/admin/diqu" },
            },
        ],
    },
    {
        label: "组织信息管理",
        to: "",
        children: [
            {
                label: "组织信息查询",
                to: { path: "/admin/zuzhixinxi" },
            },
            {
                label: "组织审核查询",
                to: { path: "/admin/zuzhishenhe" },
            },
        ],
    },
    {
        label: "组织活动管理",
        to: "",
        children: [
            {
                label: "组织活动查询",
                to: { path: "/admin/zuzhihuodong" },
            },
            {
                label: "活动审核查询",
                to: { path: "/admin/huodongshenhe" },
            },
        ],
    },
    {
        label: "入组申请管理",
        to: "",
        children: [
            {
                label: "入组申请查询",
                to: { path: "/admin/ruzushenqing" },
            },
            {
                label: "入组审核查询",
                to: { path: "/admin/ruzushenhe" },
            },
        ],
    },
    {
        label: "活动申请管理",
        to: "",
        children: [
            {
                label: "活动申请查询",
                to: { path: "/admin/huodongshenqing" },
            },
            {
                label: "审核申请查询",
                to: { path: "/admin/shenheshenqing" },
            },
        ],
    },
    {
        label: "结算志愿管理",
        to: "",
        children: [
            {
                label: "结算志愿查询",
                to: { path: "/admin/jiesuanzhiyuan" },
            },
            {
                label: "结算审核查询",
                to: { path: "/admin/jiesuanshenhe" },
            },
        ],
    },
    {
        label: "志愿墙管理",
        to: "",
        children: [
            {
                label: "志愿墙查询",
                to: { path: "/admin/zhiyuanqiang" },
            },
        ],
    },
    {
        label: "志愿时刻管理",
        to: "",
        children: [
            {
                label: "帖子查询",
                to: { path: "/admin/tiezi" },
            },
            {
                label: "回复查询",
                to: { path: "/admin/huifu" },
            },
        ],
    },
    {
        label: "系统管理",
        to: "",
        children: [
            {
                label: "轮播图添加",
                to: { path: "/admin/lunbotu/add" },
            },
            {
                label: "轮播图查询",
                to: { path: "/admin/lunbotu" },
            },
            {
                label: "反馈查询",
                to: { path: "/admin/fankui" },
            },
        ],
    },

];

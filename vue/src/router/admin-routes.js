import { session } from "@/utils/utils";

export default [
    {
        path: "wxuser",
        name: "AdminwxuserList",
        component: () => import("@/views/wxuser/list.vue"),
        meta: { title: "微信用户列表", authLogin: true },
    },

    {
        path: "wxuser/add",
        name: "AdminwxuserAdd",
        component: () => import("@/views/wxuser/add.vue"),
        meta: { title: "添加微信用户", authLogin: true },
    },
    {
        path: "wxuser/updt",
        name: "AdminwxuserUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/wxuser/updt.vue"),
        meta: { title: "编辑微信用户", authLogin: true },
    },
    {
        path: "admins",
        name: "AdminadminsList",
        component: () => import("@/views/admins/list.vue"),
        meta: { title: "管理员列表", authLogin: true },
    },

    {
        path: "admins/add",
        name: "AdminadminsAdd",
        component: () => import("@/views/admins/add.vue"),
        meta: { title: "添加管理员", authLogin: true },
    },
    {
        path: "admins/updt",
        name: "AdminadminsUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/admins/updt.vue"),
        meta: { title: "编辑管理员", authLogin: true },
    },
    {
        path: "admins/updtself",
        name: "AdminadminsUpdtSelf",
        props: (route) => ({ id: session("id") }),
        component: () => import("@/views/admins/updtself.vue"),
        meta: { title: "更新个人资料", authLogin: true },
    },
    {
        path: "zhiyuanzhe",
        name: "AdminzhiyuanzheList",
        component: () => import("@/views/zhiyuanzhe/list.vue"),
        meta: { title: "志愿者列表", authLogin: true },
    },

    {
        path: "zhiyuanzhe/add",
        name: "AdminzhiyuanzheAdd",
        component: () => import("@/views/zhiyuanzhe/add.vue"),
        meta: { title: "添加志愿者", authLogin: true },
    },
    {
        path: "zhiyuanzhe/updt",
        name: "AdminzhiyuanzheUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/zhiyuanzhe/updt.vue"),
        meta: { title: "编辑志愿者", authLogin: true },
    },
    {
        path: "zhiyuanzhe/updtself",
        name: "AdminzhiyuanzheUpdtSelf",
        props: (route) => ({ id: session("id") }),
        component: () => import("@/views/zhiyuanzhe/updtself.vue"),
        meta: { title: "更新个人资料", authLogin: true },
    },
    {
        path: "lunbotu",
        name: "AdminlunbotuList",
        component: () => import("@/views/lunbotu/list.vue"),
        meta: { title: "轮播图列表", authLogin: true },
    },

    {
        path: "lunbotu/add",
        name: "AdminlunbotuAdd",
        component: () => import("@/views/lunbotu/add.vue"),
        meta: { title: "添加轮播图", authLogin: true },
    },
    {
        path: "lunbotu/updt",
        name: "AdminlunbotuUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/lunbotu/updt.vue"),
        meta: { title: "编辑轮播图", authLogin: true },
    },
    {
        path: "zuzhixinxi",
        name: "AdminzuzhixinxiList",
        component: () => import("@/views/zuzhixinxi/list.vue"),
        meta: { title: "组织信息列表", authLogin: true },
    },

    {
        path: "zuzhixinxi/chuangjianren",
        name: "AdminzuzhixinxiListchuangjianren",
        component: () => import("@/views/zuzhixinxi/chuangjianren.vue"),
        meta: { title: "组织信息列表", authLogin: true },
    },

    {
        path: "zuzhixinxi/add",
        name: "AdminzuzhixinxiAdd",
        component: () => import("@/views/zuzhixinxi/add.vue"),
        meta: { title: "添加组织信息", authLogin: true },
    },
    {
        path: "zuzhixinxi/updt",
        name: "AdminzuzhixinxiUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/zuzhixinxi/updt.vue"),
        meta: { title: "编辑组织信息", authLogin: true },
    },
    {
        path: "zuzhixinxi/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminzuzhixinxiDetail",
        component: () => import("@/views/zuzhixinxi/detail.vue"),
        meta: { title: "组织信息详情", authLogin: true },
    },
    {
        path: "diqu",
        name: "AdmindiquList",
        component: () => import("@/views/diqu/list.vue"),
        meta: { title: "地区列表", authLogin: true },
    },

    {
        path: "diqu/add",
        name: "AdmindiquAdd",
        component: () => import("@/views/diqu/add.vue"),
        meta: { title: "添加地区", authLogin: true },
    },
    {
        path: "diqu/updt",
        name: "AdmindiquUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/diqu/updt.vue"),
        meta: { title: "编辑地区", authLogin: true },
    },
    {
        path: "zuzhishenhe",
        name: "AdminzuzhishenheList",
        component: () => import("@/views/zuzhishenhe/list.vue"),
        meta: { title: "组织审核列表", authLogin: true },
    },

    {
        path: "zuzhishenhe/chuangjianren",
        name: "AdminzuzhishenheListchuangjianren",
        component: () => import("@/views/zuzhishenhe/chuangjianren.vue"),
        meta: { title: "组织审核列表", authLogin: true },
    },

    {
        path: "zuzhishenhe/add",
        name: "AdminzuzhishenheAdd",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/zuzhishenhe/add.vue"),
        meta: { title: "添加组织审核", authLogin: true },
    },
    {
        path: "zuzhishenhe/updt",
        name: "AdminzuzhishenheUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/zuzhishenhe/updt.vue"),
        meta: { title: "编辑组织审核", authLogin: true },
    },
    {
        path: "zuzhishenhe/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminzuzhishenheDetail",
        component: () => import("@/views/zuzhishenhe/detail.vue"),
        meta: { title: "组织审核详情", authLogin: true },
    },
    {
        path: "zuzhihuodong",
        name: "AdminzuzhihuodongList",
        component: () => import("@/views/zuzhihuodong/list.vue"),
        meta: { title: "组织活动列表", authLogin: true },
    },

    {
        path: "zuzhihuodong/chuangjianren",
        name: "AdminzuzhihuodongListchuangjianren",
        component: () => import("@/views/zuzhihuodong/chuangjianren.vue"),
        meta: { title: "组织活动列表", authLogin: true },
    },

    {
        path: "zuzhihuodong/add",
        name: "AdminzuzhihuodongAdd",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/zuzhihuodong/add.vue"),
        meta: { title: "添加组织活动", authLogin: true },
    },
    {
        path: "zuzhihuodong/updt",
        name: "AdminzuzhihuodongUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/zuzhihuodong/updt.vue"),
        meta: { title: "编辑组织活动", authLogin: true },
    },
    {
        path: "zuzhihuodong/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminzuzhihuodongDetail",
        component: () => import("@/views/zuzhihuodong/detail.vue"),
        meta: { title: "组织活动详情", authLogin: true },
    },
    {
        path: "huodongshenhe",
        name: "AdminhuodongshenheList",
        component: () => import("@/views/huodongshenhe/list.vue"),
        meta: { title: "活动审核列表", authLogin: true },
    },

    {
        path: "huodongshenhe/chuangjianren",
        name: "AdminhuodongshenheListchuangjianren",
        component: () => import("@/views/huodongshenhe/chuangjianren.vue"),
        meta: { title: "活动审核列表", authLogin: true },
    },

    {
        path: "huodongshenhe/add",
        name: "AdminhuodongshenheAdd",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/huodongshenhe/add.vue"),
        meta: { title: "添加活动审核", authLogin: true },
    },
    {
        path: "huodongshenhe/updt",
        name: "AdminhuodongshenheUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/huodongshenhe/updt.vue"),
        meta: { title: "编辑活动审核", authLogin: true },
    },
    {
        path: "huodongshenhe/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminhuodongshenheDetail",
        component: () => import("@/views/huodongshenhe/detail.vue"),
        meta: { title: "活动审核详情", authLogin: true },
    },
    {
        path: "ruzushenqing",
        name: "AdminruzushenqingList",
        component: () => import("@/views/ruzushenqing/list.vue"),
        meta: { title: "入组申请列表", authLogin: true },
    },

    {
        path: "ruzushenqing/chuangjianren",
        name: "AdminruzushenqingListchuangjianren",
        component: () => import("@/views/ruzushenqing/chuangjianren.vue"),
        meta: { title: "入组申请列表", authLogin: true },
    },
    {
        path: "ruzushenqing/shenqingren",
        name: "AdminruzushenqingListshenqingren",
        component: () => import("@/views/ruzushenqing/shenqingren.vue"),
        meta: { title: "入组申请列表", authLogin: true },
    },

    {
        path: "ruzushenqing/add",
        name: "AdminruzushenqingAdd",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/ruzushenqing/add.vue"),
        meta: { title: "添加入组申请", authLogin: true },
    },
    {
        path: "ruzushenqing/updt",
        name: "AdminruzushenqingUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/ruzushenqing/updt.vue"),
        meta: { title: "编辑入组申请", authLogin: true },
    },
    {
        path: "ruzushenqing/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminruzushenqingDetail",
        component: () => import("@/views/ruzushenqing/detail.vue"),
        meta: { title: "入组申请详情", authLogin: true },
    },
    {
        path: "ruzushenhe",
        name: "AdminruzushenheList",
        component: () => import("@/views/ruzushenhe/list.vue"),
        meta: { title: "入组审核列表", authLogin: true },
    },

    {
        path: "ruzushenhe/chuangjianren",
        name: "AdminruzushenheListchuangjianren",
        component: () => import("@/views/ruzushenhe/chuangjianren.vue"),
        meta: { title: "入组审核列表", authLogin: true },
    },
    {
        path: "ruzushenhe/shenqingren",
        name: "AdminruzushenheListshenqingren",
        component: () => import("@/views/ruzushenhe/shenqingren.vue"),
        meta: { title: "入组审核列表", authLogin: true },
    },

    {
        path: "ruzushenhe/add",
        name: "AdminruzushenheAdd",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/ruzushenhe/add.vue"),
        meta: { title: "添加入组审核", authLogin: true },
    },
    {
        path: "ruzushenhe/updt",
        name: "AdminruzushenheUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/ruzushenhe/updt.vue"),
        meta: { title: "编辑入组审核", authLogin: true },
    },
    {
        path: "ruzushenhe/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminruzushenheDetail",
        component: () => import("@/views/ruzushenhe/detail.vue"),
        meta: { title: "入组审核详情", authLogin: true },
    },
    {
        path: "huodongshenqing",
        name: "AdminhuodongshenqingList",
        component: () => import("@/views/huodongshenqing/list.vue"),
        meta: { title: "活动申请列表", authLogin: true },
    },

    {
        path: "huodongshenqing/chuangjianren",
        name: "AdminhuodongshenqingListchuangjianren",
        component: () => import("@/views/huodongshenqing/chuangjianren.vue"),
        meta: { title: "活动申请列表", authLogin: true },
    },
    {
        path: "huodongshenqing/shenqingren",
        name: "AdminhuodongshenqingListshenqingren",
        component: () => import("@/views/huodongshenqing/shenqingren.vue"),
        meta: { title: "活动申请列表", authLogin: true },
    },

    {
        path: "huodongshenqing/add",
        name: "AdminhuodongshenqingAdd",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/huodongshenqing/add.vue"),
        meta: { title: "添加活动申请", authLogin: true },
    },
    {
        path: "huodongshenqing/updt",
        name: "AdminhuodongshenqingUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/huodongshenqing/updt.vue"),
        meta: { title: "编辑活动申请", authLogin: true },
    },
    {
        path: "huodongshenqing/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminhuodongshenqingDetail",
        component: () => import("@/views/huodongshenqing/detail.vue"),
        meta: { title: "活动申请详情", authLogin: true },
    },
    {
        path: "shenheshenqing",
        name: "AdminshenheshenqingList",
        component: () => import("@/views/shenheshenqing/list.vue"),
        meta: { title: "审核申请列表", authLogin: true },
    },

    {
        path: "shenheshenqing/chuangjianren",
        name: "AdminshenheshenqingListchuangjianren",
        component: () => import("@/views/shenheshenqing/chuangjianren.vue"),
        meta: { title: "审核申请列表", authLogin: true },
    },
    {
        path: "shenheshenqing/shenqingren",
        name: "AdminshenheshenqingListshenqingren",
        component: () => import("@/views/shenheshenqing/shenqingren.vue"),
        meta: { title: "审核申请列表", authLogin: true },
    },

    {
        path: "shenheshenqing/add",
        name: "AdminshenheshenqingAdd",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/shenheshenqing/add.vue"),
        meta: { title: "添加审核申请", authLogin: true },
    },
    {
        path: "shenheshenqing/updt",
        name: "AdminshenheshenqingUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/shenheshenqing/updt.vue"),
        meta: { title: "编辑审核申请", authLogin: true },
    },
    {
        path: "shenheshenqing/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminshenheshenqingDetail",
        component: () => import("@/views/shenheshenqing/detail.vue"),
        meta: { title: "审核申请详情", authLogin: true },
    },
    {
        path: "jiesuanzhiyuan",
        name: "AdminjiesuanzhiyuanList",
        component: () => import("@/views/jiesuanzhiyuan/list.vue"),
        meta: { title: "结算志愿列表", authLogin: true },
    },

    {
        path: "jiesuanzhiyuan/chuangjianren",
        name: "AdminjiesuanzhiyuanListchuangjianren",
        component: () => import("@/views/jiesuanzhiyuan/chuangjianren.vue"),
        meta: { title: "结算志愿列表", authLogin: true },
    },
    {
        path: "jiesuanzhiyuan/shenqingren",
        name: "AdminjiesuanzhiyuanListshenqingren",
        component: () => import("@/views/jiesuanzhiyuan/shenqingren.vue"),
        meta: { title: "结算志愿列表", authLogin: true },
    },

    {
        path: "jiesuanzhiyuan/add",
        name: "AdminjiesuanzhiyuanAdd",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/jiesuanzhiyuan/add.vue"),
        meta: { title: "添加结算志愿", authLogin: true },
    },
    {
        path: "jiesuanzhiyuan/updt",
        name: "AdminjiesuanzhiyuanUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/jiesuanzhiyuan/updt.vue"),
        meta: { title: "编辑结算志愿", authLogin: true },
    },
    {
        path: "jiesuanzhiyuan/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminjiesuanzhiyuanDetail",
        component: () => import("@/views/jiesuanzhiyuan/detail.vue"),
        meta: { title: "结算志愿详情", authLogin: true },
    },
    {
        path: "jiesuanshenhe",
        name: "AdminjiesuanshenheList",
        component: () => import("@/views/jiesuanshenhe/list.vue"),
        meta: { title: "结算审核列表", authLogin: true },
    },

    {
        path: "jiesuanshenhe/chuangjianren",
        name: "AdminjiesuanshenheListchuangjianren",
        component: () => import("@/views/jiesuanshenhe/chuangjianren.vue"),
        meta: { title: "结算审核列表", authLogin: true },
    },
    {
        path: "jiesuanshenhe/shenqingren",
        name: "AdminjiesuanshenheListshenqingren",
        component: () => import("@/views/jiesuanshenhe/shenqingren.vue"),
        meta: { title: "结算审核列表", authLogin: true },
    },

    {
        path: "jiesuanshenhe/add",
        name: "AdminjiesuanshenheAdd",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/jiesuanshenhe/add.vue"),
        meta: { title: "添加结算审核", authLogin: true },
    },
    {
        path: "jiesuanshenhe/updt",
        name: "AdminjiesuanshenheUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/jiesuanshenhe/updt.vue"),
        meta: { title: "编辑结算审核", authLogin: true },
    },
    {
        path: "jiesuanshenhe/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminjiesuanshenheDetail",
        component: () => import("@/views/jiesuanshenhe/detail.vue"),
        meta: { title: "结算审核详情", authLogin: true },
    },
    {
        path: "guanfangzuzhi",
        name: "AdminguanfangzuzhiList",
        component: () => import("@/views/guanfangzuzhi/list.vue"),
        meta: { title: "官方组织列表", authLogin: true },
    },

    {
        path: "guanfangzuzhi/add",
        name: "AdminguanfangzuzhiAdd",
        component: () => import("@/views/guanfangzuzhi/add.vue"),
        meta: { title: "添加官方组织", authLogin: true },
    },
    {
        path: "guanfangzuzhi/updt",
        name: "AdminguanfangzuzhiUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/guanfangzuzhi/updt.vue"),
        meta: { title: "编辑官方组织", authLogin: true },
    },
    {
        path: "guanfangzuzhi/updtself",
        name: "AdminguanfangzuzhiUpdtSelf",
        props: (route) => ({ id: session("id") }),
        component: () => import("@/views/guanfangzuzhi/updtself.vue"),
        meta: { title: "更新个人资料", authLogin: true },
    },
    {
        path: "pinglun",
        name: "AdminpinglunList",
        component: () => import("@/views/pinglun/list.vue"),
        meta: { title: "评论列表", authLogin: true },
    },

    {
        path: "pinglun/pinglunren",
        name: "AdminpinglunListpinglunren",
        component: () => import("@/views/pinglun/pinglunren.vue"),
        meta: { title: "评论列表", authLogin: true },
    },

    {
        path: "pinglun/updt",
        name: "AdminpinglunUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/pinglun/updt.vue"),
        meta: { title: "编辑评论", authLogin: true },
    },
    {
        path: "zhiyuanqiang",
        name: "AdminzhiyuanqiangList",
        component: () => import("@/views/zhiyuanqiang/list.vue"),
        meta: { title: "志愿墙列表", authLogin: true },
    },

    {
        path: "zhiyuanqiang/faburen",
        name: "AdminzhiyuanqiangListfaburen",
        component: () => import("@/views/zhiyuanqiang/faburen.vue"),
        meta: { title: "志愿墙列表", authLogin: true },
    },

    {
        path: "zhiyuanqiang/add",
        name: "AdminzhiyuanqiangAdd",
        component: () => import("@/views/zhiyuanqiang/add.vue"),
        meta: { title: "添加志愿墙", authLogin: true },
    },
    {
        path: "zhiyuanqiang/updt",
        name: "AdminzhiyuanqiangUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/zhiyuanqiang/updt.vue"),
        meta: { title: "编辑志愿墙", authLogin: true },
    },
    {
        path: "tiezi",
        name: "AdmintieziList",
        component: () => import("@/views/tiezi/list.vue"),
        meta: { title: "帖子列表", authLogin: true },
    },

    {
        path: "tiezi/faburen",
        name: "AdmintieziListfaburen",
        component: () => import("@/views/tiezi/faburen.vue"),
        meta: { title: "帖子列表", authLogin: true },
    },

    {
        path: "tiezi/add",
        name: "AdmintieziAdd",
        component: () => import("@/views/tiezi/add.vue"),
        meta: { title: "添加帖子", authLogin: true },
    },
    {
        path: "tiezi/updt",
        name: "AdmintieziUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/tiezi/updt.vue"),
        meta: { title: "编辑帖子", authLogin: true },
    },
    {
        path: "tiezi/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdmintieziDetail",
        component: () => import("@/views/tiezi/detail.vue"),
        meta: { title: "帖子详情", authLogin: true },
    },
    {
        path: "huifu",
        name: "AdminhuifuList",
        component: () => import("@/views/huifu/list.vue"),
        meta: { title: "回复列表", authLogin: true },
    },

    {
        path: "huifu/huifuren",
        name: "AdminhuifuListhuifuren",
        component: () => import("@/views/huifu/huifuren.vue"),
        meta: { title: "回复列表", authLogin: true },
    },

    {
        path: "huifu/add",
        name: "AdminhuifuAdd",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/huifu/add.vue"),
        meta: { title: "添加回复", authLogin: true },
    },
    {
        path: "huifu/updt",
        name: "AdminhuifuUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/huifu/updt.vue"),
        meta: { title: "编辑回复", authLogin: true },
    },
    {
        path: "huifu/detail",
        props: (route) => ({ id: route.query.id }),
        name: "AdminhuifuDetail",
        component: () => import("@/views/huifu/detail.vue"),
        meta: { title: "回复详情", authLogin: true },
    },
    {
        path: "fankui",
        name: "AdminfankuiList",
        component: () => import("@/views/fankui/list.vue"),
        meta: { title: "反馈列表", authLogin: true },
    },

    {
        path: "fankui/fankuiren",
        name: "AdminfankuiListfankuiren",
        component: () => import("@/views/fankui/fankuiren.vue"),
        meta: { title: "反馈列表", authLogin: true },
    },

    {
        path: "fankui/add",
        name: "AdminfankuiAdd",
        component: () => import("@/views/fankui/add.vue"),
        meta: { title: "添加反馈", authLogin: true },
    },
    {
        path: "fankui/updt",
        name: "AdminfankuiUpdt",
        props: (route) => ({ id: route.query.id }),
        component: () => import("@/views/fankui/updt.vue"),
        meta: { title: "编辑反馈", authLogin: true },
    },
    {
        path: "dianzan",
        name: "AdmindianzanList",
        component: () => import("@/views/dianzan/list.vue"),
        meta: { title: "点赞列表", authLogin: true },
    },

    {
        path: "dianzan/username",
        name: "AdmindianzanListusername",
        component: () => import("@/views/dianzan/username.vue"),
        meta: { title: "点赞列表", authLogin: true },
    },
];

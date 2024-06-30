<template>
    <div class="blankon-sidebar">
        <aside id="sidebar-left" class="sidebar-circle">
            <el-scrollbar class="sidebar-list" noresize>
                <!-- Start left navigation - menu -->
                <ul class="sidebar-menu" tabindex="0" style="outline: none">
                    <!-- Start navigation - blog -->
                    <li class="submenu" v-for="(m,k) in menus" :class="{active:k==active}">
                        <a href="javascript:void(0);" @click="active=active == k ? -1 : k">
                            <span class="icon"><i :class="m.icon?m.icon:'fa fa-globe'"></i></span>
                            <span class="text">{{ m.label }}</span>
                            <span class="arrow"></span>
                            <span class="selected"></span>
                        </a>
                        <ul>
                            <li v-for="v in m.children">
                                <router-link active-class="active" tag="li" :to="v.to">{{ v.label }}</router-link>
                            </li>
                        </ul>
                    </li>
                    <!--/ End navigation - blog -->
                </ul>
                <!-- /.sidebar-menu -->
                <!--/ End left navigation - menu -->
            </el-scrollbar>
            <!--/ End left navigation - footer -->
        </aside>
    </div>
</template>
<style type="text/scss" lang="scss">
    #sidebar-left {
        background-color: #e9eaed;
        font-family: "Open Sans", sans-serif;
        color: #636e7b;
        -webkit-font-smoothing: antialiased;
        direction: ltr;
        line-height: 21px;
        width: 100%;
        margin: 0;
        padding: 0;
        top: 50px;
        height: calc(100vh - 50px);
        .sidebar-list {
            height: 100%;
            overflow: hidden;
            .el-scrollbar__bar {
                &.is-vertical {
                    width: 4px; //滚动条宽度
                }
            }
            .el-scrollbar__wrap {
                /*overflow: hidden;*/
                overflow-y: scroll;
                overflow-x: hidden;
            }
        }
    }
    #sidebar-left {
        position: fixed;
        left: 0px;
        width: 220px;
        float: left;
        z-index: 200;
        background-color: #2a2a2a;
        .sidebar-menu {
            list-style: none;
            padding: 0;
            position: relative;
            margin-bottom: 0px;
            padding-bottom: 50px;
        }

        .sidebar-menu ul li a {
            font-size: 12px;
            text-decoration: none;
            padding: 8px 0 8px 22px;
            display: block;
            text-transform: capitalize;
            color: #777777;
        }

        .sidebar-menu > li {
            display: block;
            position: relative;
        }
        .sidebar-menu > li.active {
            background-color: #3c3c3c;
        }
        .sidebar-menu > li:first-child.active {
            margin-top: -1px;
        }
        .sidebar-menu li:after {
            position: absolute;
            content: "";
            left: 55px;
            bottom: -1px;
        }
        .sidebar-menu > li:after {
            border-left: 2px solid #373737;
        }
        .sidebar-menu > li > a {
            display: block;
            padding: 6px 15px;
            text-decoration: none;
        }
        .sidebar-menu > li > a > span {
            display: inline-block;
            color: #777777;
            margin-right: 5px;
        }
        .sidebar-menu > li.active > a span {
            color: #d0d0d0;
        }
        .sidebar-menu > li.active .icon {
            text-shadow: 0px 1px 1px #777777;
        }
        .sidebar-menu > li > a > .icon i {
            text-align: center;
            line-height: 25px;
            width: 29px;
            font-size: 12px;
            color: #777777;
            border-radius: 50%;
            border: 2px solid #373737;
            background-color: #222222;
        }
        .sidebar-menu > li.active > a > .icon i {
            background-color: #81b71a;
            color: #ffffff;
        }
        .sidebar-menu > li > a:hover span {
            color: #d0d0d0;
        }
        .sidebar-menu > li > a > .arrow {
            vertical-align: middle;
            font-weight: 400;
            text-align: center;
            font-size: 13px;
            position: absolute;
            top: 10px;
            right: 20px;
        }
        .sidebar-menu > li > a > .arrow:before {
            content: "\f105";
        }
        .sidebar-menu > li > a > .arrow:before {
            font-family: FontAwesome;
            font-size: 15px;
        }
        a {
            color: #81b71a;
        }
        a,
        button {
            outline: none !important;
        }

        .sidebar-menu > li > a:after {
            position: absolute;
            content: " ";
            left: 29px;
            top: -13px;
            bottom: 0px;
            z-index: -1;
        }
        .sidebar-menu > li > a > .icon:after {
            content: " ";
            position: absolute;
            top: 0px;
            bottom: 0px;
            left: 29px;
            z-index: -1;
            border: 1px solid #373737;
        }
        .sidebar-menu > li > a > .arrow,
        .sidebar-menu > li > a > .plus {
            vertical-align: middle;
            font-weight: 400;
            text-align: center;
            font-size: 13px;
            position: absolute;
            top: 10px;
            right: 20px;
            transition: transform 200ms linear;
        }

        .sidebar-menu > li > a > .selected {
            display: none;
            background-image: none;
            float: right;
            position: absolute;
            right: -5px;
            top: 14px;
            background: none;
            width: 0;
            height: 0;
            border-style: solid;
            border-top: 6px double transparent;
            border-bottom: 6px double transparent;
            border-left: 0;
            border-right: 6px solid #f3f3f4;
        }
        .sidebar-menu > li.active > a > .selected {
            display: block;
        }
        .sidebar-menu > li.active > a span {
            color: #d0d0d0;
        }
        .sidebar-menu > li.active > a > .arrow {
            transform: rotate(90deg);
        }
        .sidebar-menu > li.submenu ul {
            display: none;
        }
        .sidebar-menu > li > ul > li {
            line-height: 24px;
            border-bottom: 1px solid #373737;
        }
        .sidebar-menu > li > ul > li {
            line-height: 15px;
            border-bottom: 1px solid #373737;
        }
        .sidebar-menu ul {
            margin: 0;
            padding: 0;
            background-color: #1d1d1d;
            list-style: none;
        }
        .sidebar-menu ul li {
            position: relative;
        }
        .sidebar-menu > li.submenu.active > ul {
            display: block;
        }
        .sidebar-menu > li > ul > li.active {
            background-color: #000000;
        }

        .sidebar-menu ul li.active a {
            color: #b7b7b7;
        }
        .sidebar-menu ul li.active:after {
            background-color: #81b71a;
        }
        .sidebar-menu ul li a:before {
            color: #373737;
        }
        .sidebar-menu ul li.active a:before {
            color: #373737;
        }
        .sidebar-menu > li > ul > li a:before {
            content: "\2014\00a0";
            margin-left: 13px;
        }
        .sidebar-menu > li > ul > li:after {
            z-index: 1;
            width: 8px;
            height: 8px;
            left: 26px;
            top: 13px;
            bottom: auto;
            border-radius: 50%;
            border-color: rgba(0, 0, 0, 0);
            transition: all 0.5s ease-in-out 0s;
            box-shadow: 0 0 0 2px #373737;
        }
        .sidebar-menu > li > ul > li > a:hover {
            background-color: #000000;
        }
        .sidebar-menu ul li a:hover {
            color: #b7b7b7;
        }
        .sidebar-menu ul li:hover a:before {
            color: #81b71a;
        }
        .sidebar-menu ul li:hover:after,
        .sidebar-menu ul li.active:after {
            background-color: #81b71a;
        }
        .sidebar-menu > li > ul > li:hover:after {
            box-shadow: 0 0 0 5px #628a14;
        }
        .sidebar-menu > li > ul:after {
            position: absolute;
            content: "";
            left: 29px;
            top: 39px;
            bottom: 0;
            border-left: 2px solid #373737;
        }
    }
    html {
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    }
</style>
<script>
    import menu from "@/views/admin/sidebar/index";

    export default {
        name: "blankon-sidebar",
        data() {
            return {
                active: 0,
                menus: [],
            };
        },
        watch: {},
        computed: {},
        methods: {},
        created() {},
        mounted() {
            menu.getMenus().then((res) => {
                var menus = (this.menus = res);
                var active = -1;
                var path = this.$route.path;

                for (var i in menus) {
                    var ci = menus[i];
                    for (var j in ci.children) {
                        var v = ci.children[j];
                        if (v.to == path) {
                            active = i;
                            break;
                        }
                    }
                    if (active != -1) break;
                }
                if (active != -1) {
                    this.active = active;
                }
            });
        },
        destroyed() {},
    };
</script>

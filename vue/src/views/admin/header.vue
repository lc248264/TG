<template>
    <header id="header">
        <!-- Start header left -->
        <div class="header-left">
            <!-- Start offcanvas left: This menu will take position at the top of template header (mobile only). Make sure that only #header have the `position: relative`, or it may cause unwanted behavior -->
            <div class="navbar-minimize-mobile left" @click="$emit('open-mini-mise')">
                <i class="fa fa-bars"></i>
            </div>
            <!--/ End offcanvas left -->

            <!-- Start navbar header -->
            <div class="navbar-header">
                <!-- Start brand -->
                <a class="navbar-brand" href="index.html"> 后台管理 </a
                ><!-- /.navbar-brand -->
                <!--/ End brand -->
            </div>
            <!-- /.navbar-header -->
            <!--/ End navbar header -->

            <!-- Start offcanvas right: This menu will take position at the top of template header (mobile only). Make sure that only #header have the `position: relative`, or it may cause unwanted behavior -->
            <div class="navbar-minimize-mobile right">
                <el-dropdown trigger="click">
                    <a href="javascript:;" class="dropdown-toggle el-dropdown-link" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                    </a>

                    <template #dropdown>
                        <el-dropdown-menu>
                            <el-dropdown-item disabled>{{ $session.username }}（{{ $session.cx }}）</el-dropdown-item>
                            <el-dropdown-item @click.native="$goto('/admin/mod')">修改密码</el-dropdown-item>
                            <el-dropdown-item @click.native="logout">退出登录</el-dropdown-item>
                        </el-dropdown-menu>
                    </template>
                </el-dropdown>
            </div>
            <!--/ End offcanvas right -->

            <div class="clearfix"></div>
        </div>
        <!-- /.header-left -->
        <!--/ End header left -->

        <!-- Start header right -->
        <div class="header-right">
            <!-- Start navbar toolbar -->
            <div class="navbar navbar-toolbar">
                <!-- Start left navigation -->
                <ul class="nav navbar-nav navbar-left">
                    <!-- Start sidebar shrink -->
                    <li class="navbar-minimize">
                        <a href="javascript:void(0);" title="Minimize sidebar"> {{ config.title }} </a>
                    </li>
                    <!--/ End sidebar shrink -->
                </ul>
                <!-- /.nav navbar-nav navbar-left -->
                <!--/ End left navigation -->

                <!-- Start right navigation -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- /.nav navbar-nav navbar-right -->

                    <!-- Start profile -->
                    <li class="dropdown navbar-profile">
                        <el-dropdown>
                            <a href="#" class="dropdown-toggle el-dropdown-link" data-toggle="dropdown">
                                <span class="meta">
                                    <span class="avatar" style="margin-right: 8px; display: inline-block">
                                        <e-img :src="$session.touxiang" v-if="$session.touxiang" class="img-circle" alt="admin"></e-img>
                                        <img src="./img.png" v-else class="img-circle" alt="admin" />
                                    </span>
                                    <span class="text text-muted">{{ $session.username }} （{{ $session.cx }}）</span>
                                    <span class="fa fa-angle-down"></span>
                                </span>
                            </a>
                            <template #dropdown>
                                <el-dropdown-menu slot="dropdown">
                                    <el-dropdown-item @click.native="$goto('/admin/mod')">修改密码</el-dropdown-item>
                                    <el-dropdown-item @click.native="logout">退出登录</el-dropdown-item>
                                </el-dropdown-menu>
                            </template>
                        </el-dropdown>
                    </li>
                    <!-- /.dropdown navbar-profile -->
                    <!--/ End profile -->
                </ul>
                <!--/ End right navigation -->
            </div>
            <!-- /.navbar-toolbar -->
            <!--/ End navbar toolbar -->
        </div>
        <!-- /.header-right -->
        <!--/ End header left -->
    </header>
</template>
<style type="text/scss" scoped lang="scss">
    #header {
        height: 50px;
        margin-bottom: 0;
        border: none;
        position: relative;
        z-index: 300;
        background: #ffffff;
        a {
            text-decoration: none;
            text-underline: none;
        }
        a:focus {
            text-decoration: none;
            text-underline: none;
        }
        .header-left {
            float: left;
            position: relative;
        }
        .header-left .navbar-header {
            height: 51px;
            width: 220px;
            left: 0;
        }
        .header-left .navbar-minimize-mobile {
            color: #ffffff;
            display: none;
        }
        .navbar-minimize-mobile {
            background-color: #81b71a;
        }
        .navbar-brand {
            float: left;
            height: 50px;
            padding: 15px 15px;
            font-size: 18px;
            line-height: 20px;
        }
        .navbar-header {
            background-color: #81b71a;
            .navbar-brand {
                padding: 0;
                text-align: center;
                width: 100%;
                color: white;
                vertical-align: middle;
                font-size: 20px;
                line-height: 50px;
                text-transform: capitalize;
            }
        }
        .header-left .navbar-minimize-mobile {
            color: #ffffff;
            display: none;
        }

        .header-right {
            float: left;
            position: absolute;
            left: 220px;
            right: 0px;
        }
        .navbar {
            -webkit-border-radius: 0px;
            -moz-border-radius: 0px;
            border-radius: 0px;
        }
        .navbar-toolbar {
            border-bottom: none;
            margin-bottom: 0px;
            background-color: #ffffff;
        }
        .header-right .navbar {
            border: none;
        }
        .nav {
            padding-left: 0;
            margin-bottom: 0;
            list-style: none;
        }
        .nav > li {
            position: relative;
            display: block;
        }
        .navbar-toolbar .navbar-left .navbar-minimize {
            border-right: 1px solid #dddddd;
        }
        .navbar-toolbar .navbar-left .navbar-minimize {
            border-right: 1px solid #dddddd;
        }

        .nav > li {
            position: relative;
            display: block;
        }
        .nav > li > a {
            position: relative;
            display: block;
            padding: 10px 15px;
        }
        .navbar-nav > li > a {
            padding-top: 10px;
            padding-bottom: 10px;
            line-height: 20px;
        }
        .navbar-toolbar .navbar-left .navbar-minimize a {
            padding-top: 16px;
            padding-bottom: 13px;
        }
        .navbar-nav.navbar-right:last-child {
            margin-right: 0px;
        }
        .navbar-right {
        }
        .navbar-toolbar .navbar-right .navbar-profile {
            margin-right: 15px !important;
        }
        .navbar-toolbar .navbar-right .navbar-profile a {
            padding-top: 8px;
            padding-right: 11px;
            padding-bottom: 8px;
            display: block;
            .meta {
                display: table;
                width: 100%;
                line-height: 30px;
                .avatar {
                    display: table-cell;
                    vertical-align: middle;
                    width: 35px;
                    height: 35px;
                    img {
                        display: block;
                        width: 100%;
                    }
                }
            }
        }
    }
    .img-circle {
        border-radius: 50%;
    }
    @media (min-width: 768px) {
        .navbar-header {
            float: left;
        }
        .navbar-nav {
            float: left;
            margin: 0;
        }
        .navbar-nav > li {
            float: left;
        }
        .navbar-left {
            float: left !important;
        }
        .navbar-right {
            float: right !important;
            margin-right: -15px;
        }
        .navbar-right {
            float: right !important;
            margin-right: -15px;
        }
    }
</style>
<script>
    import config from "@/config";
    import { logout } from "@/utils/utils";
    export default {
        name: "blankon-header",
        data() {
            return {
                config,
            };
        },
        watch: {},
        computed: {},
        methods: {
            logout,
        },
        created() {},
        mounted() {},
        destroyed() {},
    };
</script>

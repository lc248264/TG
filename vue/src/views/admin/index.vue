<template>
    <div class="blankon-index" :class="{'mobile-open':mobileopen}" id="wrapper">
        <blankon-header @open-mini-mise="mobileopen=!mobileopen"></blankon-header>
        <blankon-sidebar class="blankon-left"></blankon-sidebar>
        <div class="blankon-main">
            <router-view></router-view>
        </div>
        <div class="mask" @click="mobileopen=false"></div>
    </div>
</template>
<style type="text/scss" lang="scss">
    .blankon-index {
        padding: 0px;
        margin: 0px;
        height: 100%;
        position: relative;
        .mask {
            position: fixed;
            left: 0px;
            top: 0px;
            right: 0px;
            bottom: 0px;
            background: rgba(0, 0, 0, 0.5);
            display: none;
            z-index: 1;
        }
        #header {
            height: 50px;
            margin-bottom: 0;
            border: none;
            position: fixed;
            z-index: 300;
            left: 0px;
            right: 0px;
            top: 0px;
        }
        .blankon-main {
            margin-left: 220px;
            margin-top: 50px;
            padding: 20px;
        }
    }

    @media screen and (max-width: 768px) {
        .blankon-index {
            .blankon-left {
                #sidebar-left {
                    left: -220px;
                    transition: left 200ms linear;
                }
            }

            .blankon-main {
                margin-left: 0px;
            }
            #header {
                .header-left {
                    width: 100%;
                    display: flex;
                    line-height: 50px;
                    .navbar-header {
                        flex-grow: 1;
                    }
                    .navbar-minimize-mobile {
                        display: inline;
                        width: 50px;
                        flex-shrink: 0;
                        text-align: center;
                    }
                    .clearfix {
                        display: none;
                    }
                    .left {
                        border-right: 1px solid #F0F0F0;
                    }
                    .right {
                        border-left: 1px solid #F0F0F0;
                    }
                }
                .header-right {
                    display: none;
                    left: 0px;
                }
            }
        }
    }

    .blankon-index.mobile-open {
        .blankon-left {
            #sidebar-left {
                left: 0px;
            }
        }
        .mask {
            display: block;
        }
    }
</style>
<script>
    import BlankonHeader from "./header";
    import BlankonSidebar from "./sidebar";

    export default {
        name: "blankon-index",
        components: { BlankonSidebar, BlankonHeader },
        data() {
            return {
                mobileopen: false,
            };
        },
        watch: {},
        computed: {},
        methods: {},
        created() {},
        mounted() {},
        destroyed() {},
    };
</script>

<template>
  <el-container>
    <el-header>
      <el-menu class="center-menu" style="background-color: #7D4CDB;;" router>
        <el-menu-item @click="goHome"><el-text class="my-el-text">首页</el-text></el-menu-item>
        <el-menu-item @click="goToPageSubs"><el-text class="my-el-text">盲猜</el-text></el-menu-item>
      </el-menu>
    </el-header>
    <el-main class="mymain">
      <router-view></router-view> <!-- 路由视图，用于渲染匹配的组件 -->
    </el-main>
  </el-container>
</template>

<script>

export default {
  name: 'YourPageComponent',
  data() {
    return {
      
    };
  },
  components: {},

  created() {
    this.goHome();
  },
  methods: {
    goHome(){
      if (this.$router.currentRoute.path !== '/ahome') {
        this.$router.push('/ahome');
      }
    },
    goToPageSubs(){
      if (this.$router.currentRoute.path !== '/subs') {
        this.$router.push("/subs");
      }
    }
  }
};
</script>

<style scoped>
.center-menu {
  display: flex;
  justify-content: center;
  background-color: #7D4CDB;
}

.mymain{
  margin-top:-25px;
}

.center-menu .el-menu-item {
  margin-right: 50px;
  /* 设置右侧间距为20px */
  background-color: #7D4CDB;
}

/* 最后一个菜单项不需要右边距 */
.center-menu .el-menu-item:last-child {
  margin-right: 0;
 
}

.my-el-text:hover{
  border-bottom: 2px solid white; /* 设置悬停时的底部边框为白色 */
}

.my-el-text{
  color:  #fdfbfb;
}


</style>

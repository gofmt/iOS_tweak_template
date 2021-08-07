## iOS Hook 插件模版(Clion)

### 功能
1. 使用CMake管理工程，使用牛逼的 Clion 做插件开发；
2. 放弃烦人的 logos 语法，回归基本的 Swizzled Hook，通过最本源的方式编写Hook插件；
3. 集成了 fishhook 框架；
4. 集成了 NSBlock 打印；

### 使用
1. 使用 clion 直接打开项目；
2. 修改 control 内的对应信息；
3. 修改 iOS_tweak_template.plist 为你的插件名称；
4. 修改 iOS_tweak_template.plist 内的目标 BundleID；
5. 点击 clion 编译目标，点击绿色小榔头编译，选择正确的编译目标会自动安装插件；
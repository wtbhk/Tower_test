Tower后端测试
====
建立测试数据

    localhost:3000/init
然后

    localhost:3000/?user=<1,2,3> 
    
user=1,2,3分别是三个用户的视角，Json输出
测试数据
----
2个Project，3个User
User1(Admin)
User2(Member) -> Project1
User3(Guest) -> Project2
创建的20个Todo分别属于Project1,2,3，同时产生20个创建任务的Event

接下来
----
功能完善的前端
更多动态类型
Rspec还没看过Orz..

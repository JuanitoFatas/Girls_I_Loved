上一集：[Rails 前世今生](http://ruby-china.org/topics/2799)

## 001 你的第一个 Rails 应用

在我们来做第一个 Rails 应用之前，先讲讲 Rails 框架的三大哲学：

* DRY 不是 DIY 阿，可别看错了。意思是不要重造轮子，要在前人的大树下乘凉。

* Convention Over Configuration，约定优于配置，很多事儿大牛们都替你想好了。

* REST 网络应用最佳模式，让你组织你的应用，符合标准的 HTTP 操作。

再来不免俗的我也来讲讲 MVC，MVC 是 Model View Controller 的缩写，模型、视图、控制器。恩不负责任的解释一下大概是：

* 模型 -- 让程序员远离操作数据库的恶梦

* 视图 -- 用户看到的页面

* 控制器 -- 模型与视图的仲介，跟模型要资料拿给视图显示。

为神马要使用 MVC 呢？恩，让业务逻辑脱离页面，还记得**那些年我们一起在 HTML 里面塞 PHP 代码的日子吗？**放心，都过去了，一切都会好起来的。还有一个好处是，让你重复利用你的代码、让你的代码可以更简单的维护。但是这样听起来还是很抽象，等你学了 200 小时左右，你差不多就能有点感觉了，还是没感觉的话，那去 OGC 吧（头转90度...）。

好现在让我们开始一个最简单的 Rails 应用...在这之前，得先安装好环境。

### 安装 Rails

* Windows 有 Installer -> [点我点我点我](http://railsinstaller.org/)

* Mac 的朋友可以看看这个安装脚本：[ThoughtBot Laptop Script][TLS]

还可以顺便装一下 RVM，RVM 是 Ruby 版本管理工具，可以让你尝鲜安装最新版的 Ruby，也可以装往日美好的 Ruby，重要的是它还替你的 Gems 造了一个空间，让你不怕把系统弄坏！更多信息：[RVM 官网][RVM]、[RVM 与 Gemset][RVMG]。

我使用 Rails 3.2.3 版本来讲解之后的例子，你可能需要 Ruby 1.9.3：

`rvm install 1.9.3` (设为缺省：`rvm use --default 1.9.3` )

如果你的电脑已经有了 Ruby 1.9.2+ 与 [RubyGems][RGC]，Mac/Unix 安装 Rails 就是：

    gem install rails -v 3.2.3

也可说是一键安装了...

**为什么坊间及各大论坛有无数的帖子及书籍教你如何装 Rails？**

恩，很高兴你这么问，Rails 受益于它集成了很多个第三方的 Gems，这可能是你家楼下卖油条的老伯写的 Gem，或是远在太平洋那端美国小伙子边喝酒边写的，也可能是德艺双馨苍老师写的 Gem ，谁知道呢？说不定那人不维护了，以及 Rails 的版本更迭很快，Gem 的版本也更新的很快，同时 Ruby 也在更新，这些组织起来就会有兼容问题，新的好功能不支援旧语法，就变成现在这个情况了，呃。。。每一次 bundle 胆颤心惊，building native ... 看到这个讯息，很有可能又不兼容了，啊！！！！！！！而 GFW 又大大的加大了我们的难度（详见：[RubyGems镜像](RGC)），真是用心，这样子磨练我们，为了让我们都成为一个更好的人，一个更好的程序员。

但是我们不怕，其实我略懂命理，我算过了，萤幕前的你，上辈子的名字是...折腾。

**活著就是快乐的折腾著！**

好了，我相信你已经成功安装 Rails。上车吧，动车要开动了。。。

呜——呜—— 呜——呜—— 

### 第一个 Rails 应用

这个例子呢，叫做 `girls_I_loved` ，这个应用呢主要是记录我们曾经深爱过的女孩，唉也只是曾经了。

首先我们使用 `rails` 命令来创建这个应用：

    rails new girls_I_loved

接下来，啪拉，一堆信息喷出，**DONT PANIC！** 握紧你的鼠标，真是激动人心的一刻，你终于成为一个大菜鸟 Rails 程序员了。这些产生出来的文件，我们之后会慢慢解释。

*温馨提示* ：`rails help` 可以看到 `rails` 命令的帮助信息。

#### 启动你的应用

要启动你的应用呢，首先先来一招 `cd girls_I_loved` 俐落地切换到应用目录下 

(`[path-to-your-app/girls_I_loved] $`)

接下来我们使用 `rails server` 来启动我们的应用，缺省是使用 Ruby 标配的 WEBrick 服务器，端口三千，打开你的浏览器，

到 `http://0.0.0.0:3000/` 或是 `http://localhost:3000/` 或是 `http://127.0.0.1:3000/` ，

取决于你的喜好，你会看到一个安心上路的页面：

![welcome-page](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/Ruby%20on%20Rails_%20Welcome%20aboard.png)

右边有两个关于 Rails 的链接，两个 Ruby 文档的链接，你还可以进入：

About your application’s environment 看看你的 Rails 环境。

在里面你会看到有一行：

Environment development

Rails 提供你三种环境：`development`, `test`, `production` ，开发、测试、生产。缺省是 `development` 模式，在开发模式下呢，你的类不会被缓存的（cached），也就是说你在类里改动你的代码，不需重启服务器，嘿嘿。但是生产模式就不是如此了。

还有这行告诉我们正使用缺省的 `sqlite3` 数据库：

Database adapter  sqlite3

*温馨提示* ：要跳出服务器，可以按 `ctrl + C` 。`rails s` ＝ `rails server`。

#### 给我一个鹰架，我可以搭起整个 Rails 应用。

**scaffold** 是 Rails 提供的一个命令，搭载许多基本的功能，让你快速建个原型来看看，我们将会使用鹰架来演示这个例子，基本上实际的项目是不用鹰架的，因为根据不同客户的需求，我们手工打造我们的应用，也有人称 Rails 程序员是 craftman 就是这个缘故。

让我们来创建这个 `我们深爱过的女孩` 应用吧：

    rails generate scaffold girl name:string number:integer

又是一堆信息，别慌张，其实就是产生了模型、视图、控制器、剩下的稍后叙述。

而

    girl name:string number:integer

这段命令是什么呢？首先 `girl` 是你深爱过的女孩，`name` 是她的芳名，类别是字串；`number` 是第几任，类别是整数。。。

这个命令顺便也替你把数据库、物件属性（attribute）相关的东西都搞好了，接下来让我们在数据库创建这个表。要创建这个表呢，在 Rails 当中叫做迁移（Migration）。

迁移是 Rails 管理数据库版本的一种形式，让你的数据库可以滚动增加它的 schema。为什么说它可以管理数据库的版本呢？嗯，每一个迁移都会盖上一个时间戳章（Timestamp），注明了数据库的日期。这样子别人来跟你一起开发应用时，就知道你确切的数据库日期了。不过这个我们深爱过的女孩应用，还是自己开发就好了，你有注意到刚刚产生的信息中，有一个这样子的文件吗：

    db/migrate/[YYYYMMDDHHMMSS]_create_girls.rb

让我们打开这个文件看看（在 `db/migrate/` 目录下）：

    class CreateGirls < ActiveRecord::Migration
      def change
        create_table :girls do |t|
          t.string :name
          t.integer :number

          t.timestamps
        end
      end
    end

可以看到这个类继承自 `ActiveRecord::Migration` ，在类里面呢，定义了一个 `change` 方法。

让我们接著看下去：

    create_table :girls do |t|

很显然的替我们在数据库建立一个叫做 `girls` 的表，带有名字与任号，后面的 `t.timestamps` 就是我刚刚说的时间戳章，会设置成目前的时间（ `created_at` 与 `updated_at` ）。有了这个时间戳，Rails 之后还能帮我们恢复数据呢（术语叫做回滚 rollback）！其实呢，这个 `change` 方法隐含了 `up` 与 `down` ，建立与删除资料表，但我们现在不用担心这个，等到你的迁移够复杂时，在拆开来写就好。

OK! 接下来让我们正式迁移看看，敲入这行命令 `rake db:migrate` ，产生：

    ==  CreateGirls: migrating ====================================================
    -- create_table(:girls)
       -> 0.0021s
    ==  CreateGirls: migrated (0.0022s) ===========================================

这个 `rake db:migrate` 命令实际调用了隐含的 `up` 方法，因为这是你第一次运行迁移命令， Rails 会产生一个 `db/development.sqlite3` 文件，并产生 `girls` 表。注意！这个 `rake db:migrate` 不仅仅只执行一个迁移，它会依序执行你所有的迁移！

Rails 同时也持续关注你的一个文件 `db/schema.rb` ：

    ActiveRecord::Schema.define(:version => YYYYMMDDHHMMSS) do

      create_table "girls", :force => true do |t|
        t.string   "name"
        t.integer  "number"
        t.datetime "created_at", :null => false
        t.datetime "updated_at", :null => false
      end

    end

这里的 `YYYYMMDDHHMMSS` 应跟你的迁移档

（ `db/migrate/[YYYYMMDDHHMMSS]_create_girls.rb` ）匹配，这让你之后可以这样子加载旧的数据库：

    rake db:schema:load

*温馨提示* ：回滚可以透过 `rake db:rollback` 来给最新一次的迁移做 `down` 方法。

#### 加入及浏览深爱过的女孩

让我们再次启动服务器： `rails s` ，并开启这个页面： http://localhost:3000/girls/ ：

![GirlsILoved](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/GirlsILoved.png)

还没有深爱过的女孩列在上面，让我们按 `New Girl` 来添加一个：

![NewGirl](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/NewGirl.png)

你看到你刚刚产生的栏位了吧（名字、任号），这个页面实际上是 `GirlsController` 的 `new` 动作（action）的结果。

而这个视图就放在 `app/views/girls/new.html.erb` ，其内容为：

    <h1>New girl</h1>

    <%= render 'form' %>

    <%= link_to 'Back', girls_path %>

这是一个 ERB 文件，什么是 ERB 呢？Embedded RuBy。其实是嵌入 Ruby 代码的 HTML 文件。可以这样嵌入：

`<%=  %>` 以及 `<%  %>` ，带等号会输出在页面上，没带等号不会输出至页面。你可以拿不带等号的来创一些变量：

    <% hot=true %> 

呵呵...在这个 ERB 文件里，

第一行我们可以看到，我们给这个页面下了一个 `h1` 标题，`render` 方法传入了一个字串 `'form'` ，这个 `render` 方法会去渲染（render）这个字串名字的 `partial` 。

什么是 `partial` ？一个 `partial` 是一个模版，我们可以把它加进来，达到不重用代码的最高原则 DRY！！！！！！

`link_to` 方法替你产生了一个 `a` 标签，带有 `Back` 名字，其 `href` 属性设置为 `girls_path` ，会自动转成 `/girls` ，至于为什么我们以后再谈。

很好！现在我们来看看 `_form.html.erb` 这个文件：

    <%= form_for(@girl) do |f| %>
      ...
    <% end %>

这里定义了一个表单，使用了 `form_for` 这个 helper。`form_for` 方法传入了一个参数，一个实体变量叫做 `@gril` ， 并用这个变量 `@girl` 来产生一个表单，这个变量是从哪来的呢？茫茫人海中。。。

是从 `GirlsController` 控制器的 `new` 动作来的：

    def new
      @girl = Girl.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @girl }
      end
    end

第一行我们呼叫了 Girl 模型的 `new` 方法，建立了一个实体变量 `@girl` 。而这个实体变量 `@girl` 自动由 Rails 替你传给视图。

接下来，有一个 `respond_to` 方法，定义了这个动作回应的方法（HTML 与 JSON 格式），这里 `format.html` 会渲染 `new.html.erb` 这个文件，`format.json` 会回传一个 `@girl` 的 JSON 版本。

呼，直到现在你只写了一行代码： 

    rails generate scaffold girl name:string number:integer

就得到了这么多，[喔！哇！喔！哇！喔！哇！][SJLW]

让我们再回来看看 `_form.html.erb` ，在 `<%= form_for(@girl) do |f| %>` 与 `<% end %>` 之间的区块：

    <% if @girl.errors.any? %>
      <div id="error_explanation">
        <h2><%= pluralize(@girl.errors.count, "error") %> prohibited this girl from being saved:</h2>

        <ul>
        <% @girl.errors.full_messages.each do |msg| %>
          <li><%= msg %></li>
        <% end %>
        </ul>
      </div>
    <% end %>

先是检查 `@girl` 对象是否有任何错误（挑女孩可不能这样哦！），这些错误会从模型来，比如你的这个 `@girl` 对象没有通过模型所设置的验证（validation）需求，验证稍后讲解。如果有任何错误存在的话，就会被渲染成 `if` 区块内的内容。

让我们来看看这个 `_form.html.erb` 的后半部：

    <div class="field">
      <%= f.label :name %><br />
      <%= f.text_field :name %>
    </div>
    <div class="field">
      <%= f.label :number %><br />
      <%= f.number_field :number %>
    </div>
    <div class="actions">
      <%= f.submit %>
    </div>

相信聪明如你，已经看出来这里建立了给我们填入的栏位及按钮。

现在让我们回到浏览器，填入深爱过的女孩的名字，你会看到类似于下图的结果：

![new girl 01](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/new%20girl%2001.png)

让我们来深入探讨一下是如何得到这个结果的（孤单、寂寞、D盘）：

当你按下 `submit` 按钮时，它帮你把数据传给控制器的 `create` 动作：

    def create
      @girl = Girl.new(params[:girl])

      respond_to do |format|
        if @girl.save
          format.html { redirect_to @girl, notice: 'Girl was successfully created.' }
          format.json { render json: @girl, status: :created, location: @girl }
        else
          format.html { render action: "new" }
          format.json { render json: @girl.errors, status: :unprocessable_entity }
        end
      end
    end

这里你同样使用了你在 `new` 动作看过的 `Girl.new` 。但这次你传入了一个参数，`params[:girl]` 。params 是 parameters 的缩写，会回传一个从表单传来的像是哈希(hash)的对象。当你把这个 `params[:girl]` 传给 `new` 方法时，Rails 使用表单的值帮你设定对象的属性。

在 `respond_to` 是一个 `if-else` 结构，`if` 这里的 `@girl.save` 确保这个记录（record）是合法的，如果储存成功即返回真并存入数据库。

如果我与苍老师之间是真愛，这个 `redirect_to` 方法将你重導向至新產生的 `@girl` 对象，这个方法接受一个路径或对象，替你转成相应的路径。这个 `redirect_to` 方法解读你传入的 `@girl` 对象，并判断你要到 `girl_path` 因为这是一个 Girl 模型的对象。这个路径把你带到控制器的 `show` 动作。里面的 `notice:` 会显示一个 `flash` 信息。一个 `flash` 信息是一个在下次请求（request）所显示的信息。（也就是上图上方的绿色字体）

那要是我跟苍老师的愛是禁断的愛恋怎么办？（not valid），`@girl.save` 会返回假（任何不是 `nil` `false` 视为假）。并使用 `render` 方法来显示 `new` 动作的模版。但注意，这里并没有呼叫 `new` 动作，仅显示模版而已（要让他再次呼叫 `new` 动作可是非常难的一件事情，这个我留给 Ruby-china 社区的大神解释）。

我们可以使用验证(validation)，让 `@girl` 不合法。让我们看看如何做吧！

#### 验证你与女孩之间的愛

你可以在模型里加入验证，比如你娘亲要求你只能跟有名字的女孩交往，不能用程序员的方式定义任号（从第一任开始，而不是第零任），且每个女孩只能独立一任。。。世上只有妈妈最伟大，我们只好硬著头皮来实现这个艰钜的请求。

让我们来看看如何实现吧，打开 `Girl` 模型（ `app/models/girl.rb`），并将其内容改为：

    class Girl < ActiveRecord::Base
      attr_accessible :name, :number
      validates :name, :presence => true
      validates :number, :presence => true, 
                         :uniqueness => true, 
                         :numericality => { :greater_than => 1 }
    end

你使用了 `validates` 方法来定义一个验证，确保有输入名字，任号确保有输入、唯一、大于一。现在让我们试试看，打开这个页面：http://localhost:3000/girls 按下 `New Girl` 链接，并直接按 `Create Girl` 按钮，你会看到如下图般的错误：

![validate-errors](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/validate-errors.png)

如你预期的错误，现在你可以依照伟大母亲大人的指示输入栏位，

name：`"#{初恋情人}"` 

    希望不是 NameError: undefined local variable or method `初恋情人' for main:Object

让我们在试试看我们的 `greater_than` 有没有起作用，任号输入 `-1` 看看：

![minus-one](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/minus1.png)

It works! 让我们完成这些栏位：

![first-love](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/first-love.png)

有的朋友会问，怎么任号是 2 了，不对吧？不好意思各位，**1 号的位置我留给了永远的苍老师。**

在网址栏的结尾你会看到

http://localhost:3000/girls/N

`N` 是模型 Girl 中一个独一无二的数字 ID。这哪来的？让我们看看控制器中的 `show` 动作的视图模版（在 `app/views/girls/show.html.erb` ）：

    <p id="notice"><%= notice %></p>

    <p>
      <b>Name:</b>
      <%= @girl.name %>
    </p>

    <p>
      <b>Number:</b>
      <%= @girl.number %>
    </p>


    <%= link_to 'Edit', edit_girl_path(@girl) %> |
    <%= link_to 'Back', girls_path %>

第一行是 `notice` 方法，显示由 `create` 动作内，重定向 `redirec_to` 里设置的 `notice` ：

  format.html { redirect_to @girl, notice: 'Girl was successfully created.' }

之后在 `p` 标签里，呼叫 `@girl` 的 `name` 与 `number` 方法，显示名字及任号，这个对象是在你控制器的 `show` 动作所定义的：

    def show
      @girl = Girl.find(params[:id])

      ...
    end

这个 `Girl` 类别的 `find` 方法让你找到 ID 是 `params[:id]` 的纪录（record），创建一个新的 `Girl` 对象，并把 `params[:id]` 作为网址的结尾数字 `N`。

让我们在回到 `show.html.erb` 文件的下方：

    <%= link_to 'Edit', edit_girl_path(@girl) %> |
    <%= link_to 'Back', girls_path %>

产生了两个链接，Edit 与 Back。第一个 `link_to` 方法的第二个参数 `edit_girl_path(@girl)` 方法是由 `config/routes.rb` 里的一个方法调用所提供的。让我们现在来看看 `config/routes.rb` 。


#### 陆游：山重水复疑无路，柳暗花明又一村

看来我们南宋朝的诗人就懂得 Rails 的路由了。。。（唉你现在知道为什么这篇文章分类是瞎扯淡了吧）

这柳暗花明又一村呢，是哪一村，让我们看看 `config/routes.rb` 这一村（没有注解）：

    GirlsILoved::Application.routes.draw do
      resources :girls
    end

每个 Rails 应用的 `config/routes.rb` 文件，都用了简洁的 Ruby 语法定义了应用程序的路由。这个文件里使用的方法，定义了请求至控制器之间的路线。

    resources :girls

在 Rails 当中，相似对象的集合，称为资源（resources）。这个方法定义了路由（routes）与路由的 helpers，这个 helper 比如我们使用的这个 `edit_girl_path` 。下表列出了路由以及对应的 helper：

![helpers-routes](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/helpers-routes.png)

在这个表里，`:id` 可以被记录的 ID 替换。每一个路由的 helper 都有一个替代版本，可以给你全部的网址。把 `girls_path` 换成 `girls_url` 就会给你完整的网址：http://localhost:3000/girls。

另外，有两个路由会根据不同的请求（request），做出不同的动作。如果你使用 `GET` 请求的话，第一个路由：`/girls` 会带你到 `GirlsController` 的 `index` 动作。`GET` 请求是标准浏览器的请求之一，这是你对这个应用做的第一个请求（到 http://localhost:3000/ 页面）如果你对这个路由 `/girls` 做 `POST` 请求，它会去调用控制器的 `create` 动作。这也是你先前按下 New Girl 的动作。恩，我讲你可能不太相信，让我带你看看，先跳到 http://localhost:3000/girls/new 页面，并鼠标右键 -> 检视源代码，你会看到表单中：

    <form accept-charset="UTF-8" action="/girls" class="new_girl" id="new_girl" method="post">

嘿嘿！这里有两个要注意的属性，就是 `action` 与 `method` 属性。`action` 指出了这个表单要去的路由，而 `method` 告诉浏览器何种 HTTP 请求。

这个表单是在哪渲染的呢？呵呵，你先前已经看过了，在 `app/views/girls/new.html.erb` ：

    <h1>New girl</h1>

    <%= render 'form' %>

    <%= link_to 'Back', girls_path %>

这里我们渲染了一个 `partial`，位于 `app/views/girls/_form.html.erb` 的 `form`：

    <%= form_for(@girl) do |f| %>

这一行伟大的代码产生了 `form` 表单！等会儿我们看看 `edit` 动作时，你会发现同样的表单有不同的结果，太猛了！

另一个不同的路由是 `/girls/{id}` 路由，这个路由有三个方式。第一个是你已经看过的，你加入一个你深愛的女孩，使用 GET 请求来重定向的 `show` 动作，第二个是我们现在要讨论的 `update` ，更新你深愛的女孩的数据。

现在让我们来改动一下女孩的任号，或许初恋情人是你的第五任也说不定（有的人觉得直到他找到对的女孩才算初恋，之前的一点恋愛感觉都没有）打开
http://localhost:3000/girls 页面，按下 Edit 链接，你会看到如下的图示：

![edit-first-love](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/edit-first-love.png)

这个页面跟我们看到的 `new` 动作所产生的页面相似。体会到 `partial` 的威力了么？你可以根据不同的请求，使用同样的代码。这个 `edit.html.erb` 的内容为：

    <h1>Editing girl</h1>

    <%= render 'form' %>

    <%= link_to 'Show', @girl %> |
    <%= link_to 'Back', girls_path %>

然而这个动作呢，你在修改的是先前存在的对象，而不是像你在 `new` 动作所使用的一个新的对象。这个已经存在的对象是透过 `GirlsController` 的 `edit` 动作找到的：

    def edit
      @girl = Girl.find(params[:id])
    end

如何找到一个对象的代码跟之前我们看过的 `show action` 一模一样！！！！！！！也就是说咱重复了代码，但现在先不讨论这个。

再回到刚刚的 `edit.html.erb` ：

    <h1>Editing girl</h1>

    <%= render 'form' %>

    <%= link_to 'Show', @girl %> |
    <%= link_to 'Back', girls_path %>

下面你使用了 `link_to` 来创建两个链接，Show 与 Back 链接。Show 链接连到你在控制器的 `edit` 动作设置好的 `@girl` 对象。按下这个链接会带你到 `girl_path(@girl)` (`/girls/:id`)。Rails 会自己根据对象的类别，想出链接接下来要去哪，使用这种 Rails 特殊的语法，它会去调用 `girl_path` 方法（因为这个对象是 Girl 类别），并且产生相应的网址给你。

接下来看看 Back 链接，使用了 `girls_path`。它不能使用一个对象，因为没道理，你要返回的是你深爱过的女人的清单。。。而呼叫 `girls_path` 是一个回到 `index` 动作的简单方法。

好现在我们来试试看填入这个表单，举例来说，把初恋情人改为第五任好了，并按下 Update Girl 按钮，你会看到：

![fifth](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/fifth.png)

按下 Update Girl 会带你回到 `show` 页面。这是怎么发生的？按下 Back 按钮回到清单，并看看此页的源代码( http://localhost:3000/2/edit/)，你会看到：

    <form accept-charset="UTF-8" action="/girls/2" class="edit_girl" id="edit_girl_2" method="post"       
    <div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="_method" type="hidden" value="put" />...
    </div>

这个表单的 `action` 指向 `/girls/2` ，也就是 `GirlsController` 的 `show` 动作。这里使用的 `method` 使用的是 POST。结束了吗？还没，看看下面透过 `_method` 参数的 `input` 标签，其中 `value` 被设为 PUT。Rails 注意到这个参数，并且把这个 POST 请求变成 PUT 请求。这是我们刚刚说的三个方式之一，这是第二个。藉由给这个路由 `/girls/{id}` 发送一个 PUT 请求，你被带到了 `GirlsController` 的 `update` 动作，让我们来看看 `update` 动作都干了什么：

    def update
      @girl = Girl.find(params[:id])

      respond_to do |format|
        if @girl.update_attributes(params[:girl])
          format.html { redirect_to @girl, notice: 'Girl was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @girl.errors, status: :unprocessable_entity }
        end
      end
    end

和 `show` 与 `edit` 动作一样，你用 `find` 把对象拿出来。而表单的参数和 `create` 动作使用一样的路数透过 `params[:girl]` 传进来。而下面不同的是，这里用的是一个 `update_attributes` 方法。这个方法人如其名，更新属性！而这个方法的名字还有一件你不知道的事儿，它同时也验证了属性，确保你的属性是合法的，如果合法的话呢，更新、储存、返回真。念起来真顺口，哈哈！

当 `update_attributes` 返回真的时候呢，你被重定向至这个女孩的 `show` 动作。那返回假的时候呢？你被显示在 `edit` 模版，并提示出错的信息，这里跟我们之前看过的 `create` 动作一样，只是回页面，没有使用 `edit` 动作：

    def create
    ...
    else
      format.html { render action: "new" }
      format.json { render json: @girl.errors, status: :unprocessable_entity }
    end

呼，终于讲完验证了，希望你可以让你的娘亲高兴。

#### 删除...删除那些不愉快的记忆

好，要是那个女孩伤你很深，你要把它从记录中抹去呢？（抹的掉记录，抹不掉回忆的。。。）

在 Rails，`DELETE` 用一个更强硬的名字，`DESTROY` ！！！一旦 `DESTROY` 了，那就是掰掰了，再也不见了。

好，现在把页面切换到 http://localhost:3000/girls ：

![delete](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/delete.png)

按下 Destroy ：

![only-one](https://github.com/JuanitoFatas/Girls_I_Loved/raw/master/app/assets/images/only-one.png)

现在你应该只看到苍老师，唯一的苍老师（或是你输入的）。

好，现在来讲讲这是怎么工作的。让我们看看 `app/views/girls/index.html.erb` 中间这一段 ：

    <h1>Listing girls</h1>

    ...

    <% @girls.each do |girl| %>
      <tr>
        <td><%= girl.name %></td>
        <td><%= girl.number %></td>
        <td><%= link_to 'Show', girl %></td>
        <td><%= link_to 'Edit', edit_girl_path(girl) %></td>
        <td><%= link_to 'Destroy', girl, confirm: 'Are you sure?', method: :delete %></td>
      </tr>
    <% end %>
    </table>

    <br />

    <%= link_to 'New Girl', new_girl_path %>

在这里，`@girls` 是一个从 `Girl` 模型来的所有对象的集合，很难懂吗？所有我们深爱过的女孩。我们遍历每一个女孩，并把每个特别的女孩关在一个小房间里：`|girl|` 呵呵，我相信你们都这么做过！哈哈，正经的说呢，这么做就是给下面的区块创了一个 `girl` 变量。

`name` 与 `number` 方法跟我们在 `app/views/girls/show.html.erb` 使用过的一样，是用来显示栏位值的。在这之后，建了三个链接， Show, Edit, Destroy。

第一个链接把 `girl` 对象传进来，藉由一个像是 `/girls/{id}` 的路由连到 `GirlsController` 的 `show` 动作， `{id}` 是这个对象在表里面的 ID。

第二个链接使用 `edit_girl_path` 并传入 `girl` 对象连到 `edit` 动作，这个 helper 对应的路径是 `/girls/{id}/edit` 。

第三个链接和第一个一样把 `girl` 对象传进来，但是后面指名了方法是 `:delete` ，这也就是我们的第三个方式，也是这个路由 `/girls/{id}` 有的最后一个方式。因为你把 `method:` 设为 `:delete` Rails 理解你要忘记一个女孩，并带你到 `GirlsController` 的 `destroy` 动作：

    def destroy
      @girl = Girl.find(params[:id])
      @girl.destroy

      respond_to do |format|
        format.html { redirect_to girls_url }
        format.json { head :no_content }
      end
    end

就跟我们之前看过的 `show` , `edit` , `update` 动作一样，先把 `@girl` 对象取出来（ `Girl.find(params[:id]` ）。

然后摧毁她（`@girl.destroy`）。。。再见了，我的愛人。

这把你数据库的纪录永远地删除了。然后把你重定向至 `girls_url` 也就是这里 http://localhost:3000/girls 。注意！！！ 这里使用的是 `girls_url` （ `path` 换成 `url` ），会产生一个完整的 URL。

呼，讲到这里讲完了你的第一个 Rails 应用，是不是很简单呢？

最后献上苍老师的图片一只：

[![蒼井そら](http://ww2.sinaimg.cn/bmiddle/67b532d1jw1dq6lvk4vylj.jpg)](http://zh.wikipedia.org/wiki/%E8%92%BC%E4%BA%95%E7%A9%BA)

距离学会 Rails 还有 970 个小时。。。

つづく


#### 延伸阅读：

[打造 CRUD by ihower][ihowerCRUD]

[Rails Routing from the Outside In][RRO]

[Demo App from Learn Rails By Example][DAFLRBE]

[Rails For Zombies][RFZ]

[demo-app]:https://github.com/JuanitoFatas/Girls_I_Loved
[RFZ]: http://railsforzombies.org/
[DAFLRBE]:http://ruby.railstutorial.org/chapters/a-demo-app
[RRO]: http://guides.rubyonrails.org/routing.html
[ihowerCRUD]:http://ihower.tw/rails3/basic.html
[RGC]: http://ruby.taobao.org/
[TLS]: https://github.com/thoughtbot/laptop
[RVM]: http://beginrescueend.com/
[RVMG]: http://blog.eddie.com.tw/2011/04/08/rvm-and-gemsets/
[SJLW]: http://www.washingtonpost.com/business/technology/steve-jobss-last-words-oh-wow-oh-wow-oh-wow/2011/10/31/gIQA3vKCZM_story.html

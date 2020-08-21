# Instagram クローンアプリケーション

## 本番環境
　[Toystagram](https://fierce-temple-96190.herokuapp.com/)
　ユーザー名：testuser1
　パスワード：password

## 苦労したこと・反省点
- 作成しはじめたとき、どこから手をつけていいのか迷ってしまった。
- 最初はミニテストで書きはじめたが、途中でrspecに変更認め、二度手間となってしまった。  
  最初から、rspecでテストを書くようにしたい。  
  rspecは簡単なテストしか書くことができなかったので、勉強が必要。
- jQueryとrspecに時間がかかってしまった。  
　どちらもこのWebアプリのためのものだけを学んだ程度なので、もっと知識をつける必要がある。
- 調べたことを忘れてしまい、「このエラー見たことあるけど、、、」となることが多かった。  
　出会ったエラーを記録しておくようにしたい。
- 時間がかかってしまったとき、とりあえずエラーが解決したから次へ進もうと、理解が甘くなってしまった時があった。
- 途中からこのコードは何を示しているのかメモをするようになってから、見返すときに理解が早くなったので、次からはメモを残していきたい

## 頑張ったこと
- ほぼ全ての機能を作成することができた。
- エラーが出てしまったとき、最初の頃よりもエラー文を検索するだけでなく、どう調べるか考えて解決ができるようになった。
- 特にエラーが出たときに、「例えばこのコードだと通るのかな？どういう表示になるかな？」等、実験しながら作成することができた。

## 疑問点
- app/views/microposts/_micropost.html.erbのインデントが何度調整してもGithub側でずれてしまいます。  
  以下の記事を参考に、自動のインデントを２に揃え、念のため半角スペースで記載し直しましたが、変わらずずれが生じてしまっています。  
  何か原因があるのでしょうか。
　[Qiita](https://qiita.com/pyon_kiti_jp/items/031de3fdd3c60ddc21bc).[ブログ](https://hunter-school.com/entry/2017/06/13/023545)
- gitignoreにて、差分ファイルの調整を行いましたが、一部ファイルは完全に消えているものの  
  ファイルによってはプルリクエストのページだとLoad diffとなり、ロードすれば中身が確認できる状態です。
　コードページだと消えており、見れないようになっています。
　この調整方法であっているのでしょうか。
  


## 参考元  
**ja.yml**               
- [GitHub](https://github.com/tigrish/devise-i18n/blob/master/rails/locales/ja.yml)  
**devise.ja.yml**      
- [GitHub](https://gist.github.com/yhara/606476)
- [Pikawaka](https://pikawaka.com/rails/devise)  
**OAuth**                
- [GitHub](https://github.com/simi/omniauth-facebook)
- [Qiita](https://qiita.com/TakahikoKawasaki/items/e37caf50776e00e733be)
- [Qiita](https://qiita.com/kazuooooo/items/47e7d426cbb33355590e)  
**Rspec/Factory_bot**    
- [Qiita](https://qiita.com/Ushinji/items/522ed01c9c14b680222c) 
- [Qiita](https://qiita.com/jnchito/items/42193d066bd61c740612)
- [Qiita](https://qiita.com/jnchito/items/2e79a1abe7cd8214caa5)
- [Qiita](https://qiita.com/t2kojima/items/ad7a8ade9e7a99fb4384)
- [Qiita](https://qiita.com/zongxiaojie/items/d488edd42ba3864859c7)
- [Qiita](https://qiita.com/Kohei_Kishimoto0214/items/e29e509b12a6eb484a42)
**Faker**            
- [GitHub](https://github.com/faker-ruby/faker)  
**seed**                 
- [Qiita](https://qiita.com/takehanKosuke/items/79a66751fe95010ea5ee)  
**お気に入り**         
- [Qiita](https://qiita.com/jaramon/items/248bcb4b56e9fed8fc90)
- [Qiita](https://qiita.com/s_rkamot/items/b1d4d64335f33399e713)
- [WEB系エンジニア志望のメモ](https://tkmrtech.hateblo.jp/entry/2019/10/06/173020)  
**アソシエーション**   
- [Qiita](https://qiita.com/kazukimatsumoto/items/14bdff681ec5ddac26d1)  
**コメント機能**  　　 
- [Qiita](https://qiita.com/krppppp/items/7f9563e08150a008592f)
- [Qiita](https://qiita.com/iverson3kobe0824/items/924388ca61ca0f54d119)
- [Qiita](https://qiita.com/nojinoji/items/2034764897c6e91ef982)  
**通知機能**  　　　　 
- [Qiita](https://qiita.com/E6YOteYPzmFGfOD/items/c780dd686a81a8ca32e8)
- [Qiita](https://qiita.com/tktk0430/items/bdb8fbcf4ce3258b2d41)
- [Qiita](https://qiita.com/nekojoker/items/80448944ec9aaae48d0a)
- [Qiita](https://qiita.com/yuto_1014/items/2db1dd4fcd7945b980f7)  
**検索機能**  　　　　 
- [Github](https://github.com/activerecord-hackery/ransack)
- [Qiita](https://qiita.com/fujitora/items/b2134bf6abcfda79c47f)
- [Qiita](https://qiita.com/fukuda_fu/items/58e3b5d9a776d98a62de)  
**モーダル表示**  　　 
- [Actovice](https://www.autovice.jp/articles/14)
- [Qiita](https://qiita.com/tsunemiso/items/edbc58becf55875c4fdb)
- [Bootstrap3日本語リファレンス](http://bootstrap3.cyberlab.info/)  

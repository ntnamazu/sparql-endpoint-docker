# 使い方
## 1. まずこのリポジトリのソースコードを `git clone` で `clone` する
通常通り `git clone` すればよい

## 2. Apache Jenaのコマンドラインツールをインストールする
### 2.1 任意のディレクトリに、以下リンク先から最新版のApache JenaをDLして解凍する
例:
```sh
cd ~/environment
wget https://downloads.apache.org/jena/binaries/apache-jena-4.6.0.tar.gz
tar -zxvf apache-jena-4.6.0.tar.gz
```
### 2.2 DLしたApache JenaにPATHを通す
`.bash_profile` にPATHを設定し，有効化する

例:
```sh
vi ~/.bash_profile
```

以下を追記する

```sh
export JENA_HOME=$HOME/environment/apache-jena-4.6.0
export PATH=$PATH:$JENA_HOME/bin
```

以下の `source` コマンドでコマンドを有効化する

```sh
source ~/.bash_profile
```

### 3. 任意のフォルダに、RDFファイル (拡張子 `.ttl`) を配置する
例: (`tmp` というディレクトリを切って、[日化辞のRDFファイル](https://dbarchive.biosciencedbc.jp/jp/nikkaji/data-1.html)を置く例)
```sh
mkdir ~/environment/sparql-endpoint-docker/tmp
cd ~/environment/sparql-endpoint-docker/tmp
wget https://dbarchive.biosciencedbc.jp/data/nikkaji/LATEST/NBDC_NikkajiRDF_main.tar.gz
tar -xzvf NBDC_NikkajiRDF_main.tar.gz 
rm -r NBDC_NikkajiRDF_main.tar.gz
gunzip *
```

### 4. RDFファイルを Apache Jena内のコマンド `tdb2.tdbloader` で、DBにロードする
次のコマンドで `database` フォルダに、所定の形式に変換されたRDFファイルを配置する

```sh
tdb2.tdbloader --loc ~/environment/sparql-endpoint-docker/databases/DB2 ~/environment/sparql-endpoint-docker/tmp*.ttl

```

かなり処理時間がかかるので、待つ。なおこの際に `databases/DB2` にRDFファイルの変換物が置かれるが、元のRDF総サイズに比べてかなりサイズが増えるので、注意すること。
(今回の日化辞のファイルの例だど、元のRDFファイル(解凍物)が4.6 GBであったのに対し、12 GBに増えた。)
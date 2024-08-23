# Buildroot for HPMicro MCUs
## 配置编译环境

### Ubuntu 22.04

```shell
sudo apt-get install bc bison build-essential flex libssl-dev unzip

## 编译

```shell
make hpmicro_hpm6800evk_defconfig
make all
```

## 烧录

生成的镜像路径为 `output/images/flash.img`。可使用 [hpm_manufacturing_tool](https://github.com/hpmicro/hpm_manufacturing_tool) 工具进行烧录。

修改启动模式选择管脚为 `BOOT_MODE[1:0]=0b10` 后将 USB0 连接至 PC，运行hpm_manufacturing_tool进行烧录。

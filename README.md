# React.js App Projesi

Bu proje, basit bir React.js uygulamasını oluşturmayı, Docker ile en küçük boyutta bir imaj oluşturmayı ve AWS ile Terraform kullanarak ECS Fargate üzerine dağıtmayı içermektedir. Aynı zamanda Kubernetes üzerine de uygulamanın dağıtılması öngörülmektedir.

Projeye giLab üzeriden erışmek için:
https://gitlab.com/ikbalklhc/DevOpsBootcampFinalCase.git

## Proje Yapısı

Proje aşağıdaki ana bileşenleri içerir:

- `react-app`: Temel React.js uygulamasının oluşturulduğu klasör.
- `Dockerfile`: Docker imajını oluşturmak için kullanılan dosya.
- `.gitlab-ci.yml`: GitLab CI/CD pipeline'ının tanımlandığı dosya.
- `terraform`: AWS altyapısını yönetmek için kullanılan Terraform konfigürasyon dosyalarını içerir.
- `kubernetes`: Kubernetes üzerine uygulamanın dağıtılması için gerekli manifest dosyalarını içerir.

## Dockerfile Açıklamaları

Dockerfile, uygulamayı çalıştırmak için gerekli adımları içerir. Önemli noktalar şunlardır:

- `FROM`: Uygulamanın temelini oluşturan bir başlangıç imajını belirtir.
- `WORKDIR`: Çalışma dizinini belirtir.
- `COPY`: Uygulama dosyalarını imaja kopyalar.
- `RUN`: Gerekirse, uygulama bağımlılıklarını yükler.
- `CMD`: Uygulamanın nasıl başlatılacağını belirtir.

## GitLab CI/CD Açıklamaları

GitLab CI/CD pipeline'ı, uygulamanın her aşamasını otomatikleştirmek için kullanılır. Aşamalar şunlardır:

- `build`: Docker imajını oluşturur.
- `test`: Uygulama testlerini çalıştırır.
- `deploy`:Docker imajı belirtilen Docker Container Registry'e ($DOCKER_REGISTRY) yüklenir


## AWS Altyapısı

AWS altyapısı Terraform kullanılarak oluşturulur. Aşağıdaki bileşenleri içerir:

- `VPC`: Uygulamanın çalışacağı sanal özel bulut.
- `Security Group`: Güvenlik grupları, gerekli ağ kurallarını tanımlar.
- `ECS Cluster`: ECS Fargate üzerine uygulamanın dağıtılacağı küme.
- `Application Load Balancer`: Servis önünde konumlandırılan yük dengeleyici.

## Kubernetes Dağıtımı

Kubernetes üzerine uygulamanın dağıtılması için `kubernetes` klasörü içindeki manifest dosyaları kullanılır. Bu dosyalar, servis ve deployment Kubernetes nesnelerini tanımlar.

## Nasıl Kullanılır

Terraform kısmını çalıştırıp çalısan image'ı görmek için aşağıdaki adımları çalıştırın ve output olarak verilen linkten bağlanıp görebilirsiniz. 

1. terraform init
2. terraform plan
3. terraform apply


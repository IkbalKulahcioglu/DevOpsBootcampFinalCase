React.js App Projesi
Bu proje, basit bir React.js uygulamasını oluşturmayı, Docker ile en küçük boyutta bir imaj oluşturmayı ve AWS ile Terraform kullanarak ECS Fargate üzerine dağıtmayı içermektedir. Aynı zamanda Kubernetes üzerine de uygulamanın dağıtılması öngörülmektedir.

<<<<<<< HEAD
Proje Yapısı
=======
Projeye giLab üzeriden erışmek için:
https://gitlab.com/ikbalklhc/DevOpsBootcampFinalCase.git

## Proje Yapısı

>>>>>>> origin/master
Proje aşağıdaki ana bileşenleri içerir:

react-app: Temel React.js uygulamasının oluşturulduğu klasör.
Dockerfile: Docker imajını oluşturmak için kullanılan dosya.
.gitlab-ci.yml: GitLab CI/CD pipeline'ının tanımlandığı dosya.
terraform: AWS altyapısını yönetmek için kullanılan Terraform konfigürasyon dosyalarını içerir.
kubernetes: Kubernetes üzerine uygulamanın dağıtılması için gerekli manifest dosyalarını içerir.
Dockerfile Açıklamaları
Dockerfile, uygulamayı çalıştırmak için gerekli adımları içerir. Önemli noktalar şunlardır:

FROM: Uygulamanın temelini oluşturan bir başlangıç imajını belirtir.
WORKDIR: Çalışma dizinini belirtir.
COPY: Uygulama dosyalarını imaja kopyalar.
RUN: Gerekirse, uygulama bağımlılıklarını yükler.
CMD: Uygulamanın nasıl başlatılacağını belirtir.
GitLab CI/CD Açıklamaları
GitLab CI/CD pipeline'ı, uygulamanın her aşamasını otomatikleştirmek için kullanılır. Aşamalar şunlardır:

build: Docker imajını oluşturur.
test: Uygulama testlerini çalıştırır.
deploy: Docker imajı belirtilen Docker Container Registry'e ($DOCKER_REGISTRY) yüklenir.
AWS Altyapısı
AWS altyapısı Terraform kullanılarak oluşturulur. Aşağıdaki bileşenleri içerir:

VPC: Uygulamanın çalışacağı sanal özel bulut.
Security Group: Güvenlik grupları, gerekli ağ kurallarını tanımlar.
ECS Cluster: ECS Fargate üzerine uygulamanın dağıtılacağı küme.
Application Load Balancer: Servis önünde konumlandırılan yük dengeleyici.
AWS Altyapısı Hakkında
Bu proje, AWS (Amazon Web Services) üzerinde bir ECS (Elastic Container Service) Fargate kümesi kullanarak uygulamanın dağıtılmasını içermektedir. Terraform kullanarak aşağıdaki AWS bileşenlerini oluşturmaktadır:

VPC (Virtual Private Cloud): Uygulamanın çalışacağı izole bir ağ altyapısı.
Security Group: Güvenlik grupları, uygulamanın hangi ağ kaynaklarıyla iletişim kurabileceğini belirler.
ECS Cluster: ECS Fargate üzerine dağıtılacak uygulamanın çalışacağı küme.
Application Load Balancer: Gelen istekleri dağıtan ve yükü dengeleyen bir servis önünde konumlandırılan yük dengeleyici.
AWS tarafında bu bileşenlerin nasıl çalıştığını ve konfigüre edildiğini daha ayrıntılı öğrenmek için AWS belgelerine başvurabilirsiniz.

Kubernetes Dağıtımı
Kubernetes üzerine uygulamanın dağıtılması için kubernetes klasörü içindeki manifest dosyaları kullanılır. Bu dosyalar, servis ve deployment Kubernetes nesnelerini tanımlar.


Nasıl Kullanılır
Terraform kısmını çalıştırıp çalışan image'ı görmek için aşağıdaki adımları takip edebilirsiniz. Öncelikle, Terraform komutlarını çalıştırmadan önce AWS hesabınızda gerekli izinlere sahip olduğunuzdan emin olun.

terraform init: Terraform projesini başlatır ve bağımlılıkları yükler.
terraform plan: Değişiklikleri görselleştirmek için bir plan oluşturur.
terraform apply: Değişiklikleri uygular ve AWS altyapısını oluşturur.
Bu adımları takip ettikten sonra, Terraform çıktısında belirtilen URL'yi kullanarak uygulamanızı görüntüleyebilirsiniz.

AWS ECS ve EKS Farkları
Bu projede ECS (Elastic Container Service) Fargate kullanılmıştır. Fargate, Amazon ECS'nin bir özelliğidir ve kullanıcıların konteynerleri yönetmelerine izin verirken altyapıyı yönetme ihtiyacını ortadan kaldırır. Diğer bir deyişle, ECS Fargate sayesinde kullanıcılar, altta yatan altyapıyı düşünmeden konteyner tabanlı uygulamaları çalıştırabilirler.

EKS (Elastic Kubernetes Service) ise yönetilen bir Kubernetes hizmetidir. Kullanıcılara Kubernetes kümesini hızlı bir şekilde oluşturma, ölçekleme ve yönetme imkanı sunar. EKS kullanılarak uygulama dağıtmak için, Kubernetes manifest dosyalarını kullanmak ve Kubernetes özelliklerini anlamak gerekmektedir.

Her iki hizmet de avantajlara sahiptir ve kullanılacak hizmet, projenin gereksinimlerine ve ekip tecrübesine bağlı olarak seçilmelidir.

Projenin 'main.tf' dosyası ile Terraform üzerinden aws ecs Fargate kısmını gerçekleştirdim.Bunu gerçekleştirirken öncelikli olarak repository oluşturdum. AWS kısmında ECR(Elastic Container Registry) kısmında oluşturduğum repositoryi görüntüledim ve içine girerek "View push commands" kısmındaki kodlarla image'ı ekledim. Daha sonrasında task definition (görev tanımı) oluşturdum. Bu görev tanımı, Docker konteynerlerinin nasıl çalıştırılacağını ve yapılandırılacağını tanımlar. Sonra ki adımda görevlerin çalıştırılması için gerekli olan IAM rolünü oluşturdum ve yapılandırdım. Devamında ki kodlarda VPC (Virtual Private Cloud) ve bu VPC içindeki varsayılan alt ağları (subnets) olusturacak şekilde düzenledim. Ardından  Application Load Balancer (ALB) oluşturdum ve load balancer için gerekli diğer kaynaklar olan security group, target group ve listener sırası ile oluşturdum.  Listener, gelen trafik üzerinde dinleme yapan bir bileşendir. Bu örnekte, 80 numaralı HTTP portunda dinleme yapar ve gelen trafiği belirtilen target group'a yönlendirir.Target group, load balancer tarafından yönlendirilen trafik için hedefleri tanımlar. security grup gelen trafiği kabul eder (ingress) ve tüm kaynaklardan gelen ve tüm hedeflere giden trafiği kontrol eder (egress). ALB, gelen HTTP/HTTPS trafiğini hedeflere yönlendiren yük dengeleyicidir. Bu projede terraform ile gerekli düzenlemeleri yapılandırdım. 

Terraform dosyasını oluşturmadan önce AWS üzerinden bu adımları tek tek yapmıştım bu kod kısmında çalışırken kolaylık sağladı.Gerekli adımları ve onları yapılandırırken belirlemem gereken özellikleri görerek bu kısımı daha iyi anlamamı sağladı. Aws kısmının üzerinde çalışmak aws alanları hakkında bilgi sahibi olmamı ve arayüze alışmam konusunda çok yararlı oldu.
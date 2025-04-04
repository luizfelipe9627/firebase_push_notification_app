# Firebase Push Notification App

## Sobre o Projeto
O **Firebase Push Notification App** é um aplicativo móvel desenvolvido em **Flutter** com **Dart** que implementa notificações push utilizando **Firebase Cloud Messaging (FCM)**. 

O objetivo do app é permitir o envio e recebimento de mensagens em tempo real para dispositivos cadastrados.

## Tecnologias Utilizadas
- **Flutter** (Dart)
- **Firebase Cloud Messaging (FCM)**
- **Flutter Local Notifications** (para exibir notificações quando o app estiver em primeiro plano)
- **Android SDK** (para desenvolvimento e testes em dispositivos Android)

## Configuração do Projeto
### 1. Clonar o Repositório
```sh
git clone https://github.com/luizfelipe9627/firebase_push_notification_app.git
cd firebase_push_notification_app
```

### 2. Instalar Dependências
```sh
flutter pub get
```

### 3. Configurar Firebase
1. Acesse o [Firebase Console](https://console.firebase.google.com/).
2. Crie um novo projeto e adicione um app Android e/ou iOS.
3. Baixe o arquivo `google-services.json` (para Android) e coloque dentro da pasta `android/app/`.
4. Para iOS, adicione o arquivo `GoogleService-Info.plist` em `ios/Runner/`.

### 4. Executar o Projeto
Para rodar no emulador ou dispositivo físico:
```sh
flutter run
```

### 5. Obtendo o Token do Dispositivo
Após iniciar o aplicativo, você pode obter o token do dispositivo no console da sua IDE. Esse token é essencial para enviar notificações diretamente para o dispositivo específico.

Caso queira armazená-lo no backend para futuras notificações, certifique-se de enviá-lo para o seu servidor assim que for gerado ou atualizado.

### 6. Enviando Notificações
Para enviar notificações, você pode utilizar:
- **Firebase Console** (interface gráfica para testes manuais)
- **Ferramentas de terceiros**, como Postman ou cURL, para envio via API
- **Seu próprio backend** para automação de notificações através do Firebase Admin SDK

O envio ocorre por meio de uma requisição **POST** para o endpoint do Firebase Cloud Messaging (FCM), incluindo o token do dispositivo e a mensagem desejada no corpo da requisição.

#### Exemplo de requisição via cURL por token:
```sh
curl -X POST "https://fcm.googleapis.com/fcm/send" \
     -H "Authorization: Bearer SEU_ACCESS_TOKEN" \
     -H "Content-Type: application/json" \
     -d '{
           "token": "TOKEN_DO_DISPOSITIVO",
           "notification": {
             "title": "Título da Notificação",
             "body": "Conteúdo da mensagem"
             "image": "URL da imagem"
           }
         }'
```
#### Exemplo de requisição via cURL por tópico:
```sh
curl -X POST "https://fcm.googleapis.com/fcm/send" \
     -H "Authorization: Bearer SEU_ACCESS_TOKEN" \
     -H "Content-Type: application/json" \
     -d '{
           "topic": "NOME_DO_TOPICO",
           "notification": {
             "title": "Título da Notificação",
             "body": "Conteúdo da mensagem"
             "image": "URL da imagem"
           }
         }'
```

## Funcionalidades
- Solicita permissão para notificações ao iniciar o app.
- Recebe e exibe mensagens push do Firebase.
- Notificações funcionam mesmo quando o app está em segundo plano.
- Suporte a notificações locais quando o app está aberto.

## Estrutura do Código
```
/firebase_customer_front
├── lib/
├──── firebase/
│   ├── firebase_api.dart       # Integração com Firebase Messaging
├──── main.dart               # Arquivo principal do app
├── android/
│   ├── app/
│   │   ├── google-services.json # Configuração Firebase (Android)
├── ios/
│   ├── Runner/
│   │   ├── GoogleService-Info.plist # Configuração Firebase (iOS)
├── pubspec.yaml                # Dependências do Flutter
└── README.md                   # Documentação do projeto                
```

## Licença

Este projeto é de código aberto e está sob a licença MIT.

---

🚀 **Desenvolvido com Flutter e Firebase**


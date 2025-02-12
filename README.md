# 📱 Daily Posts
Essa aplicação Flutter consome uma API de posts e permite a criação de novos posts através de um formulário. O projeto inclui testes unitários, gerenciamento de estado com Provider e armazenamento local com SharedPreferences.

## 🚀 Como rodar o projeto localmente
Siga os passos abaixo para configurar e rodar o projeto no seu ambiente local.

### **Pré-requisitos**
Certifique-se de que você tem instalado:

1. **Flutter SDK**:  
   - Instale o Flutter seguindo o [guia oficial](https://flutter.dev/docs/get-started/install).
   - Verifique se o Flutter está instalado corretamente rodando:
     ```bash
     flutter doctor
     ```
   - Resolva quaisquer problemas indicados pelo `flutter doctor`.

2. **Git**:  
   - Instale o Git a partir do [site oficial](https://git-scm.com/).

3. **Editor de Código**:  
   - Recomendo o [Visual Studio Code](https://code.visualstudio.com/) com a extensão do Flutter.

---

### **Passos para configuração**

1. **Clone o repositório**:
   ```bash
   git clone https://github.com/lanesgabriel/inside_posts.git
   cd inside_posts
2. **Instale as dependências**:
   ```bash
    flutter pub get
3. **Execute o projeto:**:
   ```bash
   flutter run
---
### **Executando o teste de API**
Para rodar o teste de API basta executar o comando
   ```bash
    flutter test
   ```

## Informações gerais
### O projeto utiliza as seguintes dependências principais:

- provider: Para gerenciamento de estado.
- http: Para requisições HTTP.
- shared_preferences: Para armazenamento local.
- flutter_test: Para testes unitários.

### Funcionalidades
- Listagem de posts: Consome uma API para buscar e exibir uma lista de posts.
- Criação de posts: Permite a criação de novos posts através de um formulário.
- Armazenamento local: Usa SharedPreferences para armazenar os posts localmente.
- Testes: Inclui testes unitários para o consumo da API.
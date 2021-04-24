<template>
  <v-container>
    <v-row justify="center" class="mt-3 text-h5">
      LOGIN
    </v-row>
    <v-row justify="center">
      <v-form>
        <v-container>
          <v-row>
            <v-col
              cols="12"
              class="pb-0"
            >
              <v-text-field
                v-model="id"
                label="ID"
                outlined
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row class="mt-0">
            <v-col
              cols="12"
              class="pb-0"
            >
              <v-text-field
                v-model="password"
                label="Password"
                outlined
              ></v-text-field>
            </v-col>
          </v-row>
          <v-row>
            <v-col
              cols="12"
            >
              <v-btn
                block
                large
                class="white--text"
                color="blue-grey"
              >LOGIN</v-btn>
            </v-col>
          </v-row>
          <v-row>
            <v-col
              cols="6"
            >
              <v-btn
                block
                large
                color="#FFD700"
              >카카오 로그인</v-btn>
            </v-col>
            <v-col
              cols="6"
            >
              <v-btn
                block
                large
                color="success"
              >네이버 로그인</v-btn>
            </v-col>
          </v-row>
          <v-divider class="mt-3"></v-divider>
          <v-row>
            <v-col
              cols="4"
            >
              <v-btn text>
                아이디 찾기
              </v-btn>
            </v-col>
            <v-col
              cols="4"
            >
              <v-btn text>
                비밀번호 찾기
              </v-btn>
            </v-col>
            <v-col
              cols="4"
            >
              <v-btn text>
                회원가입
              </v-btn>
            </v-col>
          </v-row>
        </v-container>
      </v-form>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "Login",
  data(){
    return {
      id : '',
      password : ''
    }
  }
}
</script>

<style scoped>

</style>

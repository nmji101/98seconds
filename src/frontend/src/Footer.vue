<template>
  <v-container>
    <v-row no-gutters>
      <v-col>
        <v-card
          class="pa-2"
        >
          <v-list-item>
            <v-list-item-content>
              <v-list-item-title>CONTACT US</v-list-item-title>
              <v-list-item-subtitle v-for="info in leftInfo">
                {{ info.title }} : {{ info.contents }}
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-card>
      </v-col>
      <v-divider class="ma-1" vertical></v-divider>
      <v-col>
        <v-card
          class="pa-2"
        >
          <v-list-item>
            <v-list-item-content>
              <v-list-item-title>CUSTOMER CENTER</v-list-item-title>
              <v-list-item-subtitle >
                000-0000-0000
              </v-list-item-subtitle>
              <v-list-item-subtitle >
                <template v-for="btns in btnChunkList">
                  <v-row justify="center" class="ma-2">
                    <v-col v-for="btn in btns" cols="auto">
                      <v-btn large>{{ btn.text }}</v-btn>
                    </v-col>
                  </v-row>
                </template>
              </v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "Footer",
  data(){
    return {
      leftInfo : [
        { title : 'company', contents:'서울시 성북구 장월로1길'},
        { title : 'owner', contents:'98Seconds'},
        { title : 'tel', contents:'02-123-4567'},
        { title : 'mail', contents:'98Seconds@naver.com'},
      ],
      rightBtn : [
        { text : 'NOTICE', url:'/api'},
        { text : 'Q & A', url:'/api'},
        { text : 'EVENT', url:'/api'},
        { text : 'REVIEW', url:'/api'}
      ]
    }
  },
  computed: {
    btnChunkList(){
      return _.chunk(this.rightBtn,2)
    }
  }
}
</script>

<style scoped>

</style>

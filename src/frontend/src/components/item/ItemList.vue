<template>
  <v-container>
    <!--BEST ITEM -->
    <v-row class="mt-5">
      <v-row>
        <v-col>
          <div class="text-h3">BEST ITEM</div>
        </v-col>
      </v-row>
      <v-row justify="center">
        <v-col cols="2" v-for="i in 5">
          <v-card
            class="mx-auto"
            max-width="400"
          >
            <v-img
              class="white--text align-end"
              height="200px"
              src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
            >
              <v-card-title>Top 10 Australian beaches</v-card-title>
            </v-img>
          </v-card>
        </v-col>
      </v-row>
    </v-row>
    <!--ITEM TYPE -->
    <v-row class="mt-5">
      <v-col>
        <v-row>
          <v-col>
            <div class="text-h3">ITEM TYPE</div>
          </v-col>
        </v-row>
        <v-row
          align="center"
          justify="center"
          class="mb-5"
        >
          <v-btn class="ml-2" v-for="sub in itemSubType" :key="sub">
            {{ sub }}
          </v-btn>
        </v-row>
        <v-row
          align="center"
          justify="end"
        >
          <v-btn-toggle
            tile
            color="deep-purple accent-3"
            group
          >
            <v-btn value="new">
              신상품
            </v-btn>
            <v-btn value="name">
              상품명
            </v-btn>
            <v-btn value="rowPrice">
              낮은가격
            </v-btn>
            <v-btn value="highPrice">
              높은가격
            </v-btn>
          </v-btn-toggle>
        </v-row>
        <v-row justify="center">
          <v-col cols="2" v-for="i in 5">
            <v-card
              class="mx-auto"
              max-width="400"
            >
              <v-img
                class="white--text align-end"
                height="200px"
                src="https://cdn.vuetifyjs.com/images/cards/docks.jpg"
              >
                <v-card-title>Top 10 Australian beaches</v-card-title>
              </v-img>
            </v-card>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
    <v-btn><router-link to="/ItemInsert">INSERT ITEM TEMP</router-link></v-btn>
  </v-container>
</template>

<script>
export default {
  name: "ItemList",
  data(){
    return {
      itemSubType : [
        'ALL','코트','자켓','점퍼','가디건'
      ]
    }
  }
}
</script>

<style scoped>

</style>

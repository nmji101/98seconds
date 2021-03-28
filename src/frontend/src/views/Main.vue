<template>
  <v-container>
    <v-row class="mb-10">
      <v-carousel cycle v-model="model">
        <v-carousel-item
          v-for="(color, i) in colors"
          :key="color"
        >
          <v-sheet
            :color="color"
            height="100%"
            tile
          >
            <v-row
              class="fill-height"
              align="center"
              justify="center"
            >
              <div class="display-3">
                Slide {{ i + 1 }}
              </div>
            </v-row>
          </v-sheet>
        </v-carousel-item>
      </v-carousel>
    </v-row>
    <template v-for="title in itemTitle">
      <v-row>
        <v-col>
          <div class="text-h3">{{ title }}</div>
        </v-col>
      </v-row>
      <v-row>
        <v-col cols="4" v-for="i in 3">
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

            <v-card-subtitle class="pb-0">
              Number 10
            </v-card-subtitle>

            <v-card-text class="text--primary">
              <div>Whitehaven Beach</div>

              <div>Whitsunday Island, Whitsunday Islands</div>
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </template>
    <div style="height: 300px"></div>
  </v-container>
</template>

<script>
export default {
  name: "Main",
  data(){
    return{
      model: 0,
      colors: [
        'primary',
        'secondary',
        'yellow darken-2',
        'red',
        'orange',
      ],
      itemTitle : ['BEST30','NEW']
    }
  }
}
</script>

<style scoped>

</style>

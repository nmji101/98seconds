<template>
  <v-form method="post" action="http://localhost:8081/api/item/insert">
    <v-text-field
      v-model="name"
      :error-messages="nameErrors"
      :counter="10"
      label="Name"
      required
      @input="$v.name.$touch()"
      @blur="$v.name.$touch()"
    ></v-text-field>
    <v-text-field
      v-model="color"
      label="Color"
      required
    ></v-text-field>
    <v-text-field
      v-model="fullPrice"
      label="Price"
      required
    ></v-text-field>
    <v-input v-model="saleRate" hidden></v-input>
    <v-text-field
      v-model="contents"
      label="contents"
      required
    ></v-text-field>
    <v-input v-model="itemCode" hidden></v-input>
<!--    <v-select-->
<!--      v-model="select"-->
<!--      :items="items"-->
<!--      :error-messages="selectErrors"-->
<!--      label="Item"-->
<!--      required-->
<!--      @change="$v.select.$touch()"-->
<!--      @blur="$v.select.$touch()"-->
<!--    ></v-select>-->
<!--    <template>-->
<!--      <v-file-input-->
<!--        v-model="photo1"-->
<!--        accept="image/*"-->
<!--        label="File input"-->
<!--      ></v-file-input>-->
<!--    </template>-->
    <v-input v-model="photo1" hidden></v-input>

    <v-btn
      class="mr-4"
      type="submit"
      @click="submit"
    >
      submit
    </v-btn>
    <v-btn @click="clear">
      clear
    </v-btn>
  </v-form>
</template>

<script>
import {validationMixin} from 'vuelidate'
import {email, maxLength, required} from 'vuelidate/lib/validators'

export default {
  name: "ItemInsert",
  mixins: [validationMixin],

  validations: {
    name: { required, maxLength: maxLength(10) },
    email: { required, email },
    select: { required },
    checkbox: {
      checked (val) {
        return val
      },
    },
  },

  data: () => ({
    name: '',
    color: '',
    fullPrice: '',
    contents: '',
    saleRate : 0,
    itemCode : '00000',
    select: null,
    photo1: 'temp.jpg',
    items: [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
    ],
    checkbox: false,
  }),

  computed: {
    checkboxErrors () {
      const errors = []
      if (!this.$v.checkbox.$dirty) return errors
      !this.$v.checkbox.checked && errors.push('You must agree to continue!')
      return errors
    },
    selectErrors () {
      const errors = []
      if (!this.$v.select.$dirty) return errors
      !this.$v.select.required && errors.push('Item is required')
      return errors
    },
    nameErrors () {
      const errors = []
      if (!this.$v.name.$dirty) return errors
      !this.$v.name.maxLength && errors.push('Name must be at most 10 characters long')
      !this.$v.name.required && errors.push('Name is required.')
      return errors
    },
    emailErrors () {
      const errors = []
      if (!this.$v.email.$dirty) return errors
      !this.$v.email.email && errors.push('Must be valid e-mail')
      !this.$v.email.required && errors.push('E-mail is required')
      return errors
    },
  },

  methods: {
    submit () {
      this.$v.$touch();
      // axios.post('/api/item/insert',).then(res => { console.log(res.data) })
    },
    clear () {
      this.$v.$reset()
      this.name = ''
      this.email = ''
      this.select = null
      this.checkbox = false
    },
  }
}
</script>

<style scoped>

</style>

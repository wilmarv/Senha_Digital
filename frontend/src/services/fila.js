import {http} from './conf.js'

export default{
    listar:()=> {
        return http.get('fila')
    }
}
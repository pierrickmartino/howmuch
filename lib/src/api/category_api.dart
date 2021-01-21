// //Read
// final String findCategoriesQuery = """
// query findCategories {
//   categories(order: name_ASC) {
//     count
//     edges {
//       node {
//         id
//         objectId
//         name
//         color
//         icon
//         iconfamily
//         iconpackage
//         performance
//         counter
//       }
//     }
//   }
// }
// """;

// //Create
// final String createCategoryMutation = """
// mutation createCategory (\$name : String!){
//   createCategory(input: { fields: { name: \$name }} ) {
//     category {
//       name
//       id
//       createdAt
//     }
//   }
// }
// """;

// //Update
// final String updateCategoryMutation = """
// mutation UpdateCategory (\$id: ID!, \$input: UpdateCategoryFieldsInput ){
//   updateCategory(
//     input: {id:\$id, fields:\$input}
//   ) {
//     category {
//       name
//       updatedAt
//     }
//   }
// }
// """;

// //Delete
// final String deleteCategoryMutation = """
// mutation DeleteCategory (\$id: ID!) {
//   deleteCategory(input: { id: \$id}) {
//     category {
//       name
//       id
//     }
//   }
// }
// """;

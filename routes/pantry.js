const Router = require("express");
const router = new Router();

// rutas de vistas
router.get("/", (req,res) => {
    res.render("get_pantry_items", {
        items: [ "huevos", "leche", "arroz" ]
    });
});

exports.router = router;
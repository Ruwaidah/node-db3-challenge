const db = require("../data/db-config.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first();
}

function findSteps(id) {
  return db("steps")
    .select(
      "steps.id",
      "steps.step_number",
      "steps.instructions",
      "scheme_name"
    )
    .join("schemes", "scheme_id", "schemes.id")
    .where({ scheme_id: id });
}

function addStep(newstep, id) {
  db("steps").insert(newstep, "id");
  return findSteps(id);
}

function update(data, ids) {
  console.log(ids);
  db("schemes")
    .where({ id: ids })
    .update(data);

  return findById(ids);
}

function add(data) {
  return db("schemes").insert(data);
}

function remove(ids) {
  console.log(ids);
  return db("schemes")
    .where({ id: ids })
    .delete();
}

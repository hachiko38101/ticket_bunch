const service = () => {
  const addDate = document.getElementById("add-date")
  const add10Dates =document.getElementById("add-10dates")
  const deleteBtn = document.getElementById("delete-btn")

  addDate.addEventListener("click", (e) => {
    e.preventDefault();
    let input_data = document.createElement('input');
    input_data.type = 'date';
    const parent = document.getElementById('schedule');
    parent.appendChild(input_data);

    let button_data = document.createElement('button');
    button_data.id = i;
    button_data.innerHTML = '削除';
    parent.appendChild(button_data);
    i++ ;
  });


  deleteBtn.addEventListener("click",(e) => {
    e.preventDefault();
    let target_id = target.id;
    const parent = document.getElementById('schedule');
    let ipt_id = document.getElementById('inputform_' + target_id);
    let tgt_id = document.getElementById(target_id);
    parent.removeChild(ipt_id);
    parent.removeChild(tgt_id);	
  });
};

window.addEventListener('load', service);



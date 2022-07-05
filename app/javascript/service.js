const service = () => {
  const sProgram = document.getElementById("s-program");
  const sReserve = document.getElementById("s-reserve");
  const sSeat = document.getElementById("s-seat");
  const sCustomer = document.getElementById("s-customer");
  const sETop = document.getElementById("se-top")
  const sEProgram = document.getElementById("se-program");
  const sEReserve = document.getElementById("se-reserve");
  const sESeat = document.getElementById("se-seat");
  const sECustomer = document.getElementById("se-customer");
  
  sProgram.addEventListener("mouseover", (e) => {
    e.preventDefault();
    sEProgram.removeAttribute("style","display:none;")
    sETop.setAttribute("style","display:none;")
  });

  sProgram.addEventListener("mouseout", (e) => {
    e.preventDefault();
    sEProgram.setAttribute("style","display:none;")
    sETop.removeAttribute("style","display:none;")
  });

  sReserve.addEventListener("mouseover", (e) => {
    e.preventDefault();
    sEReserve.removeAttribute("style","display:none;")
    sETop.setAttribute("style","display:none;")
  });
  
  sReserve.addEventListener("mouseout", (e) => {
    e.preventDefault();
    sEReserve.setAttribute("style","display:none;")
    sETop.removeAttribute("style","display:none;")
  });

  sSeat.addEventListener("mouseover", (e) => {
    e.preventDefault();
    sESeat.removeAttribute("style","display:none;")
    sETop.setAttribute("style","display:none;")
  });
    
  sSeat.addEventListener("mouseout", (e) => {
    e.preventDefault();
    sESeat.setAttribute("style","display:none;")
    sETop.removeAttribute("style","display:none;")
  });

  sCustomer.addEventListener("mouseover", (e) => {
    e.preventDefault();
    sECustomer.removeAttribute("style","display:none;")
    sETop.setAttribute("style","display:none;")
  });
      
  sCustomer.addEventListener("mouseout", (e) => {
    e.preventDefault();
    sECustomer.setAttribute("style","display:none;")
    sETop.removeAttribute("style","display:none;")
  });
};

window.addEventListener('load', service);
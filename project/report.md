__Design of SoC using Cortex M0__   
In this project, we build a basic SoC platform. Work includes:  
_Hardware implementation:_        
      --Implement the hardware framework that has been written in Verilog.  
      --Prototype the SoC framework onto an FPGA.  
_Software programming:_  
      --Programed the Cortex-M0 processor using assembly language.  
      --Simulate the program using Keil μVision Simulator.  
_Purpose:_  
     --Toggle the 8-bit LEDs at a given frequency  
     --Analyze the behavior of the AHB bus using an on-chip hardware debugging tool.  
     
_AHBlite Bus Structure_  
![ahb lite bus structure](https://user-images.githubusercontent.com/38091478/49682861-71491280-fae1-11e8-9544-869fef0752be.JPG)  

_List of Files Used:_  
![files used](https://user-images.githubusercontent.com/38091478/49682963-55df0700-fae3-11e8-9d70-5de17e26e6f7.JPG)  

_FPGA Output:_  
We have Used BASYS 3 FPGA board for our project.Xilinx Vivado 2017.4 tool for synthesis and simulation.  
![vivado logic analyzer output](https://user-images.githubusercontent.com/38091478/49682982-9d659300-fae3-11e8-8f6b-2ee8794c7e81.JPG)  

_Pre Optimization Layout:_  
We have used Cadence Innovus to generate the layout  
![layout_wo-opt](https://user-images.githubusercontent.com/38091478/49683033-617efd80-fae4-11e8-9c6b-4d767e081de6.png)  

_Post Optimization Layout:_  
![optimizaed layout](https://user-images.githubusercontent.com/38091478/49683047-aacf4d00-fae4-11e8-91a3-940c721263fe.png)  
After Optimzation_  
Gate area 1.0260 um^2

Level 0 Module AHBLITE_SYS Gates= 22989 Cells= 9287 Area= 23586.7 um^2  

_Power Report:_  
![power_report](https://user-images.githubusercontent.com/38091478/49707864-336bfb80-fc53-11e8-9264-3b8a2c1c36ec.png)  
_Synthesis Report Generated From Vivado:_  
![rout report](https://user-images.githubusercontent.com/38091478/49707954-978ebf80-fc53-11e8-923f-423c700f19be.JPG)  

![post implementaion](https://user-images.githubusercontent.com/38091478/49707974-aecdad00-fc53-11e8-880a-3bbad93a9389.JPG)  

![post_synthesis](https://user-images.githubusercontent.com/38091478/49707976-af664380-fc53-11e8-8516-c37e7d953b04.JPG)  

![setup](https://user-images.githubusercontent.com/38091478/49708024-dc1a5b00-fc53-11e8-89d3-d712b8a529ea.JPG)  

![hold](https://user-images.githubusercontent.com/38091478/49708022-dae92e00-fc53-11e8-8c97-5926bf5a4ee6.JPG)  

![pulse width](https://user-images.githubusercontent.com/38091478/49708023-db81c480-fc53-11e8-83c7-6817e5791b86.JPG)  

![onchip power](https://user-images.githubusercontent.com/38091478/49708078-197ee880-fc54-11e8-8a9c-9801aa9982cf.JPG)  

![schematic](https://user-images.githubusercontent.com/38091478/49708212-b3469580-fc54-11e8-9473-c1bf23faf6fc.JPG)  









     
     

# 🚦 4-Way Traffic Light Controller (Verilog)

This project implements a *4-way traffic light controller* using *Verilog HDL, designed for FPGA-based smart traffic systems. The system uses a **Finite State Machine (FSM)* to control Red, Yellow, and Green signals for four directions, ensuring smooth and safe traffic flow.

---

## 🧠 Key Features
- FSM-based control for four-way intersection  
- Configurable signal durations (Green, Yellow, Red)  
- Clock and reset synchronization  
- Includes *testbench, **RTL schematic, and **simulation waveforms*  
- Designed and simulated using *Xilinx Vivado*

---

## ⚙ Project Structure

Traffic_Light_Controller_4Way/ 
├── src/ 
    ├── Traffic_Light_Controller_4way.v 
    └── tb_Traffic_Light_Controller_4way.v 
├── schematic/ 
    ├── rtl_schematic.pdf 
    └── post_synth_schematic.pdf
├── simulation/ 
    ├── waveform_full_cycle.png 
    ├── waveform_reset_phase.png 
    └── traffic_light_4way.wcfg 
└── README.md

---

## 🧪 Simulation Details
- *Tool:* Xilinx Vivado  
- *Clock:* 10ns period (100 MHz)  
- *Reset:* Active high for 20ns  
- *Outputs:* 3-bit lights {Red, Yellow, Green} for each road  

*FSM Sequence:* S1 → S2 → S3 → S4 → S5 → S6 → repeat

---

## 📸 Screenshots
| Type | Image |
|------|-------|
| RTL Schematic | ![RTL Schematic](schematic/rtl_schematic.png) |
| Post-Synth Schematic | ![Post Synth Schematic](schematic/post_synth_schematic.png) |
| Full Cycle Waveform | ![Full Cycle Waveform](simulation/waveform_full_cycle.png) |
| Reset Phase | ![Reset Phase](simulation/waveform_reset_phase.png) |

---

## 🧰 Tools Used
- Verilog HDL  
- Xilinx Vivado (Design & Simulation)  
- GTKWave / Vivado Simulator  

---

## 🎯 Applications
- Smart Traffic Management Systems  
- FPGA-based Embedded Controllers  
- IoT Prototypes & Academic Demonstrations  

---

## 👤 Author
*John David*  
📧 vadapallijohndavid@gmail.com  
💼 [LinkedIn Profile](www.linkedin.com/in/vadapalli-john-david)

---

## 🪪 License
This project is licensed under the *MIT License* — free to use, modify, and share with credit.

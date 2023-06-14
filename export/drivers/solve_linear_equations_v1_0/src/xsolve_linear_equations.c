// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xsolve_linear_equations.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XSolve_linear_equations_CfgInitialize(XSolve_linear_equations *InstancePtr, XSolve_linear_equations_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XSolve_linear_equations_Start(XSolve_linear_equations *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_AP_CTRL) & 0x80;
    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XSolve_linear_equations_IsDone(XSolve_linear_equations *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XSolve_linear_equations_IsIdle(XSolve_linear_equations *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XSolve_linear_equations_IsReady(XSolve_linear_equations *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XSolve_linear_equations_EnableAutoRestart(XSolve_linear_equations *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XSolve_linear_equations_DisableAutoRestart(XSolve_linear_equations *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_AP_CTRL, 0);
}

void XSolve_linear_equations_Set_n(XSolve_linear_equations *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_N_DATA, Data);
}

u32 XSolve_linear_equations_Get_n(XSolve_linear_equations *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_N_DATA);
    return Data;
}

void XSolve_linear_equations_Set_A(XSolve_linear_equations *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_A_DATA, (u32)(Data));
    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_A_DATA + 4, (u32)(Data >> 32));
}

u64 XSolve_linear_equations_Get_A(XSolve_linear_equations *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_A_DATA);
    Data += (u64)XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_A_DATA + 4) << 32;
    return Data;
}

void XSolve_linear_equations_Set_B(XSolve_linear_equations *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_B_DATA, (u32)(Data));
    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_B_DATA + 4, (u32)(Data >> 32));
}

u64 XSolve_linear_equations_Get_B(XSolve_linear_equations *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_B_DATA);
    Data += (u64)XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_B_DATA + 4) << 32;
    return Data;
}

void XSolve_linear_equations_Set_X(XSolve_linear_equations *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_X_DATA, (u32)(Data));
    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_X_DATA + 4, (u32)(Data >> 32));
}

u64 XSolve_linear_equations_Get_X(XSolve_linear_equations *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_X_DATA);
    Data += (u64)XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_X_DATA + 4) << 32;
    return Data;
}

void XSolve_linear_equations_InterruptGlobalEnable(XSolve_linear_equations *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_GIE, 1);
}

void XSolve_linear_equations_InterruptGlobalDisable(XSolve_linear_equations *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_GIE, 0);
}

void XSolve_linear_equations_InterruptEnable(XSolve_linear_equations *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_IER);
    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_IER, Register | Mask);
}

void XSolve_linear_equations_InterruptDisable(XSolve_linear_equations *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_IER);
    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_IER, Register & (~Mask));
}

void XSolve_linear_equations_InterruptClear(XSolve_linear_equations *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XSolve_linear_equations_WriteReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_ISR, Mask);
}

u32 XSolve_linear_equations_InterruptGetEnabled(XSolve_linear_equations *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_IER);
}

u32 XSolve_linear_equations_InterruptGetStatus(XSolve_linear_equations *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XSolve_linear_equations_ReadReg(InstancePtr->Control_BaseAddress, XSOLVE_LINEAR_EQUATIONS_CONTROL_ADDR_ISR);
}


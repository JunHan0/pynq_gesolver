// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
// Tool Version Limit: 2019.12
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XSOLVE_LINEAR_EQUATIONS_H
#define XSOLVE_LINEAR_EQUATIONS_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xsolve_linear_equations_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XSolve_linear_equations_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XSolve_linear_equations;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XSolve_linear_equations_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XSolve_linear_equations_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XSolve_linear_equations_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XSolve_linear_equations_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XSolve_linear_equations_Initialize(XSolve_linear_equations *InstancePtr, u16 DeviceId);
XSolve_linear_equations_Config* XSolve_linear_equations_LookupConfig(u16 DeviceId);
int XSolve_linear_equations_CfgInitialize(XSolve_linear_equations *InstancePtr, XSolve_linear_equations_Config *ConfigPtr);
#else
int XSolve_linear_equations_Initialize(XSolve_linear_equations *InstancePtr, const char* InstanceName);
int XSolve_linear_equations_Release(XSolve_linear_equations *InstancePtr);
#endif

void XSolve_linear_equations_Start(XSolve_linear_equations *InstancePtr);
u32 XSolve_linear_equations_IsDone(XSolve_linear_equations *InstancePtr);
u32 XSolve_linear_equations_IsIdle(XSolve_linear_equations *InstancePtr);
u32 XSolve_linear_equations_IsReady(XSolve_linear_equations *InstancePtr);
void XSolve_linear_equations_EnableAutoRestart(XSolve_linear_equations *InstancePtr);
void XSolve_linear_equations_DisableAutoRestart(XSolve_linear_equations *InstancePtr);

void XSolve_linear_equations_Set_n(XSolve_linear_equations *InstancePtr, u32 Data);
u32 XSolve_linear_equations_Get_n(XSolve_linear_equations *InstancePtr);
void XSolve_linear_equations_Set_A(XSolve_linear_equations *InstancePtr, u64 Data);
u64 XSolve_linear_equations_Get_A(XSolve_linear_equations *InstancePtr);
void XSolve_linear_equations_Set_B(XSolve_linear_equations *InstancePtr, u64 Data);
u64 XSolve_linear_equations_Get_B(XSolve_linear_equations *InstancePtr);
void XSolve_linear_equations_Set_X(XSolve_linear_equations *InstancePtr, u64 Data);
u64 XSolve_linear_equations_Get_X(XSolve_linear_equations *InstancePtr);

void XSolve_linear_equations_InterruptGlobalEnable(XSolve_linear_equations *InstancePtr);
void XSolve_linear_equations_InterruptGlobalDisable(XSolve_linear_equations *InstancePtr);
void XSolve_linear_equations_InterruptEnable(XSolve_linear_equations *InstancePtr, u32 Mask);
void XSolve_linear_equations_InterruptDisable(XSolve_linear_equations *InstancePtr, u32 Mask);
void XSolve_linear_equations_InterruptClear(XSolve_linear_equations *InstancePtr, u32 Mask);
u32 XSolve_linear_equations_InterruptGetEnabled(XSolve_linear_equations *InstancePtr);
u32 XSolve_linear_equations_InterruptGetStatus(XSolve_linear_equations *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 64
entity lit2_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lit2_0CLK_7c2e709f;
architecture arch of lit2_0CLK_7c2e709f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l223_c6_f761]
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l223_c1_0239]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l223_c2_b3f7]
signal tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l223_c2_b3f7]
signal result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l223_c2_b3f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l223_c2_b3f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l223_c2_b3f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l223_c2_b3f7]
signal result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l223_c2_b3f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l223_c2_b3f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l223_c2_b3f7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l224_c3_3bc3[uxn_opcodes_h_l224_c3_3bc3]
signal printf_uxn_opcodes_h_l224_c3_3bc3_uxn_opcodes_h_l224_c3_3bc3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l230_c11_e50d]
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l230_c7_0b40]
signal tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l230_c7_0b40]
signal result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l230_c7_0b40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l230_c7_0b40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l230_c7_0b40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l230_c7_0b40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l230_c7_0b40]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l230_c7_0b40]
signal result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l234_c11_9fe0]
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l234_c7_a8ba]
signal tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l234_c7_a8ba]
signal result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l234_c7_a8ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l234_c7_a8ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l234_c7_a8ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l234_c7_a8ba]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l234_c7_a8ba]
signal result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l236_c3_7b8f]
signal CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l237_c22_a06d]
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l239_c11_eb8c]
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l239_c7_a16e]
signal tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l239_c7_a16e]
signal result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l239_c7_a16e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l239_c7_a16e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l239_c7_a16e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l239_c7_a16e]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l239_c7_a16e]
signal result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l240_c22_415e]
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l242_c11_44a2]
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l242_c7_3e81]
signal tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l242_c7_3e81]
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_3e81]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_3e81]
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_3e81]
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_3e81]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l242_c7_3e81]
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l243_c3_ef91]
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l245_c22_8954]
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_right : unsigned(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l250_c11_22eb]
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l250_c7_fe9d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l250_c7_fe9d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l250_c7_fe9d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l250_c7_fe9d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l250_c7_fe9d]
signal result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l253_c31_436f]
signal CONST_SR_8_uxn_opcodes_h_l253_c31_436f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l253_c31_436f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l255_c11_c3d0]
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l255_c7_658b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l255_c7_658b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3985( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761
BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_left,
BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_right,
BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_return_output);

-- tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7
tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_cond,
tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue,
tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse,
tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7
result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond,
result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7
result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond,
result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output);

-- printf_uxn_opcodes_h_l224_c3_3bc3_uxn_opcodes_h_l224_c3_3bc3
printf_uxn_opcodes_h_l224_c3_3bc3_uxn_opcodes_h_l224_c3_3bc3 : entity work.printf_uxn_opcodes_h_l224_c3_3bc3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l224_c3_3bc3_uxn_opcodes_h_l224_c3_3bc3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d
BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_left,
BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_right,
BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l230_c7_0b40
tmp16_MUX_uxn_opcodes_h_l230_c7_0b40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_cond,
tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue,
tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse,
tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40
result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond,
result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40
result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond,
result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0
BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_left,
BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_right,
BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba
tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_cond,
tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue,
tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse,
tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba
result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond,
result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba
result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond,
result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output);

-- CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f
CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_x,
CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d
BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_left,
BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_right,
BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c
BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_left,
BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_right,
BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l239_c7_a16e
tmp16_MUX_uxn_opcodes_h_l239_c7_a16e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_cond,
tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue,
tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse,
tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e
result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond,
result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e
result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond,
result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_left,
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_right,
BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2
BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_left,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_right,
BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l242_c7_3e81
tmp16_MUX_uxn_opcodes_h_l242_c7_3e81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_cond,
tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue,
tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse,
tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81
result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81
result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91
BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_left,
BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_right,
BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954
BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954 : entity work.BIN_OP_PLUS_uint16_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_left,
BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_right,
BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb
BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_left,
BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_right,
BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d
result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_cond,
result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l253_c31_436f
CONST_SR_8_uxn_opcodes_h_l253_c31_436f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l253_c31_436f_x,
CONST_SR_8_uxn_opcodes_h_l253_c31_436f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0
BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_left,
BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_right,
BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 pc,
 previous_ram_read,
 -- Registers
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_return_output,
 tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output,
 tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output,
 tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output,
 CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output,
 tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output,
 tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output,
 BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output,
 CONST_SR_8_uxn_opcodes_h_l253_c31_436f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_7d4f : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_b3f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l224_c3_3bc3_uxn_opcodes_h_l224_c3_3bc3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_0b40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l237_c3_0804 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l240_c3_d57a : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l245_c3_463b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l242_c7_3e81_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_c734 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c21_2e15_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_7d4c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_436f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_436f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c21_e95b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_f691_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_b37e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l230_l255_l223_l250_l239_l234_DUPLICATE_069a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_e025_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l230_l255_l250_l242_l239_l234_DUPLICATE_9954_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_4a90_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l260_l218_DUPLICATE_9a13_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_7d4c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l252_c3_7d4c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_c734 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l247_c3_c734;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_7d4f := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l226_c3_7d4f;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_right := to_unsigned(2, 2);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_right := to_unsigned(1, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_pc := pc;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_left := VAR_pc;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_left := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue := VAR_pc;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_436f_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse := tmp16;
     -- BIN_OP_PLUS[uxn_opcodes_h_l240_c22_415e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l230_l255_l250_l242_l239_l234_DUPLICATE_9954 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l230_l255_l250_l242_l239_l234_DUPLICATE_9954_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l245_c22_8954] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_left;
     BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_return_output := BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_return_output;

     -- result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d[uxn_opcodes_h_l230_c7_0b40] LATENCY=0
     VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_0b40_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l239_c11_eb8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_b37e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_b37e_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_e025 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_e025_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l223_c6_f761] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_left;
     BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output := BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;

     -- result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d[uxn_opcodes_h_l242_c7_3e81] LATENCY=0
     VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l242_c7_3e81_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l234_c11_9fe0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_left;
     BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output := BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l253_c31_436f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l253_c31_436f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_436f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_436f_return_output := CONST_SR_8_uxn_opcodes_h_l253_c31_436f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l230_c11_e50d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_left;
     BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output := BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l230_l255_l223_l250_l239_l234_DUPLICATE_069a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l230_l255_l223_l250_l239_l234_DUPLICATE_069a_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_4a90 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_4a90_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_f691 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_f691_return_output := result.stack_address_sp_offset;

     -- BIN_OP_PLUS[uxn_opcodes_h_l237_c22_a06d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l242_c11_44a2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_left;
     BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output := BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l255_c11_c3d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l250_c11_22eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l223_c2_b3f7] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_b3f7_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l223_c6_f761_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l230_c11_e50d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l234_c11_9fe0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l239_c11_eb8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l242_c11_44a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l250_c11_22eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l255_c11_c3d0_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l237_c3_0804 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l237_c22_a06d_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l240_c3_d57a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l240_c22_415e_return_output, 16);
     VAR_result_u16_value_uxn_opcodes_h_l245_c3_463b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l245_c22_8954_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_4a90_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l235_l243_DUPLICATE_4a90_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l230_l255_l250_l242_l239_l234_DUPLICATE_9954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l230_l255_l250_l242_l239_l234_DUPLICATE_9954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l230_l255_l250_l242_l239_l234_DUPLICATE_9954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l230_l255_l250_l242_l239_l234_DUPLICATE_9954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l230_l255_l250_l242_l239_l234_DUPLICATE_9954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l230_l255_l250_l242_l239_l234_DUPLICATE_9954_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_e025_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_e025_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_e025_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_e025_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_e025_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l230_l255_l223_l250_l239_l234_DUPLICATE_069a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l230_l255_l223_l250_l239_l234_DUPLICATE_069a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l230_l255_l223_l250_l239_l234_DUPLICATE_069a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l230_l255_l223_l250_l239_l234_DUPLICATE_069a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l230_l255_l223_l250_l239_l234_DUPLICATE_069a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l230_l255_l223_l250_l239_l234_DUPLICATE_069a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_f691_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_f691_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_f691_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_f691_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_f691_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_b37e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_b37e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_b37e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_b37e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l230_l223_l250_l239_l234_DUPLICATE_b37e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse := VAR_result_is_sp_shift_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l230_c7_0b40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l223_c2_b3f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse := VAR_result_u16_value_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l242_c7_3e81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue := VAR_result_u16_value_uxn_opcodes_h_l237_c3_0804;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue := VAR_result_u16_value_uxn_opcodes_h_l240_c3_d57a;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue := VAR_result_u16_value_uxn_opcodes_h_l245_c3_463b;
     -- CONST_SL_8[uxn_opcodes_h_l236_c3_7b8f] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_x <= VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_return_output := CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l242_c7_3e81] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond;
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output := result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l243_c3_ef91] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_left;
     BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_return_output := BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l230_c7_0b40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l253_c21_e95b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c21_e95b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l253_c31_436f_return_output);

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l250_c7_fe9d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l255_c7_658b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l223_c2_b3f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l255_c7_658b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l223_c1_0239] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l250_c7_fe9d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output;

     -- Submodule level 2
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l253_c21_e95b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l236_c3_7b8f_return_output;
     VAR_printf_uxn_opcodes_h_l224_c3_3bc3_uxn_opcodes_h_l224_c3_3bc3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l223_c1_0239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l255_c7_658b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l255_c7_658b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l223_c2_b3f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l248_c21_2e15] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c21_2e15_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l243_c3_ef91_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l250_c7_fe9d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l242_c7_3e81] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_cond;
     tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue;
     tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_return_output := tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l239_c7_a16e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output := result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;

     -- printf_uxn_opcodes_h_l224_c3_3bc3[uxn_opcodes_h_l224_c3_3bc3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l224_c3_3bc3_uxn_opcodes_h_l224_c3_3bc3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l224_c3_3bc3_uxn_opcodes_h_l224_c3_3bc3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l242_c7_3e81] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l250_c7_fe9d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l242_c7_3e81] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l250_c7_fe9d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output := result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l248_c21_2e15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l250_c7_fe9d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l242_c7_3e81] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l242_c7_3e81] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l239_c7_a16e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l239_c7_a16e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_cond;
     tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_return_output := tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l242_c7_3e81] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_cond;
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output := result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l234_c7_a8ba] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond;
     result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output := result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l239_c7_a16e] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l242_c7_3e81_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l234_c7_a8ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l230_c7_0b40] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond;
     result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output := result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l234_c7_a8ba] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_cond;
     tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue;
     tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output := tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l234_c7_a8ba] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l239_c7_a16e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output := result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l239_c7_a16e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l239_c7_a16e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l239_c7_a16e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l230_c7_0b40] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_cond;
     tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue;
     tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_return_output := tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l234_c7_a8ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l223_c2_b3f7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output := result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l230_c7_0b40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l234_c7_a8ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l230_c7_0b40] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l234_c7_a8ba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output := result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l234_c7_a8ba_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l230_c7_0b40] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_cond;
     result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output := result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l223_c2_b3f7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l223_c2_b3f7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_cond;
     tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output := tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l223_c2_b3f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l230_c7_0b40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l230_c7_0b40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l230_c7_0b40_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l223_c2_b3f7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output := result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l223_c2_b3f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l223_c2_b3f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l260_l218_DUPLICATE_9a13 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l260_l218_DUPLICATE_9a13_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3985(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l223_c2_b3f7_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l260_l218_DUPLICATE_9a13_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3985_uxn_opcodes_h_l260_l218_DUPLICATE_9a13_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;

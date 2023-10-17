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
-- Submodules: 106
entity sta2_0CLK_44f2ccf6 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_44f2ccf6;
architecture arch of sta2_0CLK_44f2ccf6 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2481_c6_7399]
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2481_c1_4307]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2481_c2_fe2a]
signal n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2481_c2_fe2a]
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2481_c2_fe2a]
signal result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2481_c2_fe2a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2481_c2_fe2a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2481_c2_fe2a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2481_c2_fe2a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2481_c2_fe2a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2481_c2_fe2a]
signal t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2482_c3_d5e7[uxn_opcodes_h_l2482_c3_d5e7]
signal printf_uxn_opcodes_h_l2482_c3_d5e7_uxn_opcodes_h_l2482_c3_d5e7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2486_c11_186d]
signal BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2486_c7_6c5e]
signal n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2486_c7_6c5e]
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2486_c7_6c5e]
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2486_c7_6c5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2486_c7_6c5e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2486_c7_6c5e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2486_c7_6c5e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2486_c7_6c5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2486_c7_6c5e]
signal t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_d252]
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2489_c7_c0f9]
signal n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_c0f9]
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2489_c7_c0f9]
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_c0f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2489_c7_c0f9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2489_c7_c0f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2489_c7_c0f9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_c0f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2489_c7_c0f9]
signal t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2494_c11_9aad]
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2494_c7_52a6]
signal n16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2494_c7_52a6]
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2494_c7_52a6]
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2494_c7_52a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2494_c7_52a6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2494_c7_52a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2494_c7_52a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2494_c7_52a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2494_c7_52a6]
signal t16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2497_c11_a274]
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2497_c7_b8d3]
signal n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2497_c7_b8d3]
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2497_c7_b8d3]
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c7_b8d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c7_b8d3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c7_b8d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2497_c7_b8d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c7_b8d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2497_c7_b8d3]
signal t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2498_c3_6f0c]
signal BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2501_c11_15fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2501_c7_737f]
signal n16_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2501_c7_737f]
signal result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2501_c7_737f]
signal result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2501_c7_737f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2501_c7_737f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2501_c7_737f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2501_c7_737f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2501_c7_737f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2504_c11_4874]
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2504_c7_6a95]
signal n16_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2504_c7_6a95]
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2504_c7_6a95]
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c7_6a95]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2504_c7_6a95]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c7_6a95]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c7_6a95]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c7_6a95]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_481b]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2509_c7_6791]
signal n16_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_6791]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2509_c7_6791]
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_6791]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2509_c7_6791]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_6791]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2509_c7_6791]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_6791]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_51b8]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2512_c7_9a4c]
signal n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_9a4c]
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_9a4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2512_c7_9a4c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_9a4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2512_c7_9a4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2512_c7_9a4c]
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2513_c3_aa44]
signal BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2515_c30_e4ef]
signal sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2518_c31_6398]
signal CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_7fcb]
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2520_c7_18ac]
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_18ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2520_c7_18ac]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_18ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2520_c7_18ac]
signal result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2522_c22_3f7c]
signal BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_1f2a]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_7695]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2525_c7_7695]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_643c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399
BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_left,
BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_right,
BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_return_output);

-- n16_MUX_uxn_opcodes_h_l2481_c2_fe2a
n16_MUX_uxn_opcodes_h_l2481_c2_fe2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond,
n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue,
n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse,
n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a
result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a
result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond,
result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a
result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output);

-- t16_MUX_uxn_opcodes_h_l2481_c2_fe2a
t16_MUX_uxn_opcodes_h_l2481_c2_fe2a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond,
t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue,
t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse,
t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output);

-- printf_uxn_opcodes_h_l2482_c3_d5e7_uxn_opcodes_h_l2482_c3_d5e7
printf_uxn_opcodes_h_l2482_c3_d5e7_uxn_opcodes_h_l2482_c3_d5e7 : entity work.printf_uxn_opcodes_h_l2482_c3_d5e7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2482_c3_d5e7_uxn_opcodes_h_l2482_c3_d5e7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d
BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_left,
BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_right,
BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output);

-- n16_MUX_uxn_opcodes_h_l2486_c7_6c5e
n16_MUX_uxn_opcodes_h_l2486_c7_6c5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond,
n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue,
n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse,
n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e
result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e
result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond,
result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output);

-- t16_MUX_uxn_opcodes_h_l2486_c7_6c5e
t16_MUX_uxn_opcodes_h_l2486_c7_6c5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond,
t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue,
t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse,
t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_left,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_right,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output);

-- n16_MUX_uxn_opcodes_h_l2489_c7_c0f9
n16_MUX_uxn_opcodes_h_l2489_c7_c0f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond,
n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue,
n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse,
n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond,
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output);

-- t16_MUX_uxn_opcodes_h_l2489_c7_c0f9
t16_MUX_uxn_opcodes_h_l2489_c7_c0f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond,
t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue,
t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse,
t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_left,
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_right,
BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output);

-- n16_MUX_uxn_opcodes_h_l2494_c7_52a6
n16_MUX_uxn_opcodes_h_l2494_c7_52a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond,
n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue,
n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse,
n16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond,
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output);

-- t16_MUX_uxn_opcodes_h_l2494_c7_52a6
t16_MUX_uxn_opcodes_h_l2494_c7_52a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond,
t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue,
t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse,
t16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_left,
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_right,
BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output);

-- n16_MUX_uxn_opcodes_h_l2497_c7_b8d3
n16_MUX_uxn_opcodes_h_l2497_c7_b8d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond,
n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue,
n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse,
n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond,
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output);

-- t16_MUX_uxn_opcodes_h_l2497_c7_b8d3
t16_MUX_uxn_opcodes_h_l2497_c7_b8d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond,
t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue,
t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse,
t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c
BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_left,
BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_right,
BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output);

-- n16_MUX_uxn_opcodes_h_l2501_c7_737f
n16_MUX_uxn_opcodes_h_l2501_c7_737f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2501_c7_737f_cond,
n16_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue,
n16_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse,
n16_MUX_uxn_opcodes_h_l2501_c7_737f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f
result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f
result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond,
result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_left,
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_right,
BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output);

-- n16_MUX_uxn_opcodes_h_l2504_c7_6a95
n16_MUX_uxn_opcodes_h_l2504_c7_6a95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2504_c7_6a95_cond,
n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue,
n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse,
n16_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond,
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond,
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output);

-- n16_MUX_uxn_opcodes_h_l2509_c7_6791
n16_MUX_uxn_opcodes_h_l2509_c7_6791 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2509_c7_6791_cond,
n16_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue,
n16_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse,
n16_MUX_uxn_opcodes_h_l2509_c7_6791_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond,
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output);

-- n16_MUX_uxn_opcodes_h_l2512_c7_9a4c
n16_MUX_uxn_opcodes_h_l2512_c7_9a4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond,
n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue,
n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse,
n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond,
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44
BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_left,
BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_right,
BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef
sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_ins,
sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_x,
sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_y,
sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2518_c31_6398
CONST_SR_8_uxn_opcodes_h_l2518_c31_6398 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_x,
CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_left,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_right,
BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac
result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond,
result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c
BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_left,
BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_right,
BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_return_output,
 n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
 t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output,
 n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output,
 t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output,
 n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output,
 t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output,
 n16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output,
 t16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output,
 n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output,
 t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output,
 n16_MUX_uxn_opcodes_h_l2501_c7_737f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output,
 n16_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output,
 n16_MUX_uxn_opcodes_h_l2509_c7_6791_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output,
 n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_return_output,
 sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_return_output,
 CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2483_c3_2798 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2482_c3_d5e7_uxn_opcodes_h_l2482_c3_d5e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_a991 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2492_c3_4c4a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2495_c3_6393 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_91be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_dc0c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_f0c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_2006 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2509_c7_6791_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2518_c21_c8a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2522_c3_7a8b : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2523_c21_21c1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2498_l2505_l2490_l2513_DUPLICATE_0489_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l2477_l2530_DUPLICATE_74d3_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_a991 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2487_c3_a991;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2492_c3_4c4a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2492_c3_4c4a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2483_c3_2798 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2483_c3_2798;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_dc0c := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2502_c3_dc0c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_f0c8 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2507_c3_f0c8;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_right := to_unsigned(7, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_2006 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_2006;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_y := to_signed(-4, 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2495_c3_6393 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2495_c3_6393;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_91be := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2499_c3_91be;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_right := to_unsigned(2, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2498_l2505_l2490_l2513_DUPLICATE_0489 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2498_l2505_l2490_l2513_DUPLICATE_0489_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2494_c11_9aad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_481b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2522_c22_3f7c] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2501_c11_15fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_1f2a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2515_c30_e4ef] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_ins;
     sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_x;
     sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_return_output := sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_51b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_d252] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_left;
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output := BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2520_c11_7fcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2523_c21_21c1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2523_c21_21c1_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2486_c11_186d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2504_c11_4874] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_left;
     BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output := BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output := result.is_sp_shift;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2509_c7_6791] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2509_c7_6791_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2481_c6_7399] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_left;
     BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output := BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2497_c11_a274] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_left;
     BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output := BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2481_c6_7399_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2486_c11_186d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_d252_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2494_c11_9aad_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2497_c11_a274_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2501_c11_15fa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2504_c11_4874_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_481b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_51b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2520_c11_7fcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_1f2a_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2522_c3_7a8b := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2522_c22_3f7c_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2498_l2505_l2490_l2513_DUPLICATE_0489_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2498_l2505_l2490_l2513_DUPLICATE_0489_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2498_l2505_l2490_l2513_DUPLICATE_0489_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2523_c21_21c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2489_l2512_DUPLICATE_2180_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_a3c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2486_l2509_l2504_l2501_l2497_l2525_l2494_l2520_l2489_l2512_DUPLICATE_a774_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2525_l2494_l2520_l2489_DUPLICATE_3267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_7cfd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2486_l2509_l2481_l2504_l2501_l2497_l2494_l2520_l2489_DUPLICATE_520e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2509_c7_6791_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2515_c30_e4ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2522_c3_7a8b;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_9a4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2520_c7_18ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2525_c7_7695] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2513_c3_aa44] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_left;
     BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_return_output := BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_6791] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2520_c7_18ac] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output := result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2481_c1_4307] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2520_c7_18ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_7695] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2498_c3_6f0c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_left;
     BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_return_output := BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2498_c3_6f0c_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2513_c3_aa44_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2506_l2491_DUPLICATE_e42f_return_output;
     VAR_printf_uxn_opcodes_h_l2482_c3_d5e7_uxn_opcodes_h_l2482_c3_d5e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2481_c1_4307_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_7695_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2525_c7_7695_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2504_c7_6a95] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2518_c31_6398] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_return_output := CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2512_c7_9a4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;

     -- printf_uxn_opcodes_h_l2482_c3_d5e7[uxn_opcodes_h_l2482_c3_d5e7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2482_c3_d5e7_uxn_opcodes_h_l2482_c3_d5e7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2482_c3_d5e7_uxn_opcodes_h_l2482_c3_d5e7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l2512_c7_9a4c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond;
     n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue;
     n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output := n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_6791] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;

     -- t16_MUX[uxn_opcodes_h_l2497_c7_b8d3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond <= VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond;
     t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue;
     t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output := t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2520_c7_18ac] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2520_c7_18ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2512_c7_9a4c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output := result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2520_c7_18ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_9a4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2512_c7_9a4c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2494_c7_52a6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond;
     t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue;
     t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output := t16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2501_c7_737f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2504_c7_6a95] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2509_c7_6791] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output := result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2518_c21_c8a8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2518_c21_c8a8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2518_c31_6398_return_output);

     -- n16_MUX[uxn_opcodes_h_l2509_c7_6791] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2509_c7_6791_cond <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_cond;
     n16_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue;
     n16_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_return_output := n16_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2509_c7_6791] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2518_c21_c8a8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2501_c7_737f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2497_c7_b8d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2509_c7_6791] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2504_c7_6a95] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;

     -- n16_MUX[uxn_opcodes_h_l2504_c7_6a95] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2504_c7_6a95_cond <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_cond;
     n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue;
     n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output := n16_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_9a4c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2489_c7_c0f9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond;
     t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue;
     t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output := t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2504_c7_6a95] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output := result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_6791] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_9a4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;
     -- t16_MUX[uxn_opcodes_h_l2486_c7_6c5e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond;
     t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue;
     t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output := t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_6791] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2504_c7_6a95] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2494_c7_52a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2501_c7_737f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2501_c7_737f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output := result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2504_c7_6a95] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;

     -- n16_MUX[uxn_opcodes_h_l2501_c7_737f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2501_c7_737f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_cond;
     n16_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue;
     n16_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_return_output := n16_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2497_c7_b8d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_6791_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2501_c7_737f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2494_c7_52a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2497_c7_b8d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2497_c7_b8d3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output := result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_c0f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2501_c7_737f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2497_c7_b8d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond;
     n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue;
     n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output := n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2504_c7_6a95] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output := result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;

     -- t16_MUX[uxn_opcodes_h_l2481_c2_fe2a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond;
     t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue;
     t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output := t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2504_c7_6a95_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2501_c7_737f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2497_c7_b8d3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2489_c7_c0f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2497_c7_b8d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2494_c7_52a6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output := result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2486_c7_6c5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2494_c7_52a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2494_c7_52a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_cond;
     n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue;
     n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output := n16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2501_c7_737f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2489_c7_c0f9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2494_c7_52a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2489_c7_c0f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond;
     n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue;
     n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output := n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2486_c7_6c5e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2489_c7_c0f9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output := result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2481_c2_fe2a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2497_c7_b8d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2494_c7_52a6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2497_c7_b8d3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2486_c7_6c5e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output := result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_c0f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2489_c7_c0f9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2486_c7_6c5e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2481_c2_fe2a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2494_c7_52a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2486_c7_6c5e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond;
     n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue;
     n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output := n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2494_c7_52a6_return_output;
     -- n16_MUX[uxn_opcodes_h_l2481_c2_fe2a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond;
     n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue;
     n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output := n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_c0f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2486_c7_6c5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2481_c2_fe2a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2481_c2_fe2a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output := result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2486_c7_6c5e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_c0f9_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2481_c2_fe2a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2486_c7_6c5e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2481_c2_fe2a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2486_c7_6c5e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2481_c2_fe2a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l2477_l2530_DUPLICATE_74d3 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l2477_l2530_DUPLICATE_74d3_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_643c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2481_c2_fe2a_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l2477_l2530_DUPLICATE_74d3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l2477_l2530_DUPLICATE_74d3_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;

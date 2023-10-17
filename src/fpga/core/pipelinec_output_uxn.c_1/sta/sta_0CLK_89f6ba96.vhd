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
-- Submodules: 78
entity sta_0CLK_89f6ba96 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_89f6ba96;
architecture arch of sta_0CLK_89f6ba96 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2437_c6_2771]
signal BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2437_c1_ac85]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2437_c2_638b]
signal n8_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2437_c2_638b]
signal result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2437_c2_638b]
signal result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2437_c2_638b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2437_c2_638b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2437_c2_638b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2437_c2_638b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2437_c2_638b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2437_c2_638b]
signal t16_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2438_c3_94d5[uxn_opcodes_h_l2438_c3_94d5]
signal printf_uxn_opcodes_h_l2438_c3_94d5_uxn_opcodes_h_l2438_c3_94d5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2442_c11_2933]
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2442_c7_f2ac]
signal n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2442_c7_f2ac]
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2442_c7_f2ac]
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2442_c7_f2ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2442_c7_f2ac]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2442_c7_f2ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2442_c7_f2ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2442_c7_f2ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2442_c7_f2ac]
signal t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2445_c11_560e]
signal BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2445_c7_6905]
signal n8_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2445_c7_6905]
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2445_c7_6905]
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2445_c7_6905]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2445_c7_6905]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2445_c7_6905]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2445_c7_6905]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2445_c7_6905]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2445_c7_6905]
signal t16_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2447_c3_ef5c]
signal CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2450_c11_570d]
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2450_c7_c5bd]
signal n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2450_c7_c5bd]
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2450_c7_c5bd]
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c7_c5bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2450_c7_c5bd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c7_c5bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c7_c5bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c7_c5bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2450_c7_c5bd]
signal t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2453_c11_9eca]
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2453_c7_1282]
signal n8_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2453_c7_1282]
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2453_c7_1282]
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2453_c7_1282]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2453_c7_1282]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2453_c7_1282]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2453_c7_1282]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2453_c7_1282]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2453_c7_1282]
signal t16_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2454_c3_0e02]
signal BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2457_c11_b8c3]
signal BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2457_c7_3b66]
signal n8_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2457_c7_3b66]
signal result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2457_c7_3b66]
signal result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2457_c7_3b66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2457_c7_3b66]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2457_c7_3b66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2457_c7_3b66]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2457_c7_3b66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2460_c11_e06e]
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2460_c7_7f4f]
signal n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2460_c7_7f4f]
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2460_c7_7f4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2460_c7_7f4f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2460_c7_7f4f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2460_c7_7f4f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2460_c7_7f4f]
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2463_c30_c791]
signal sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_c839]
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_b852]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_b852]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2468_c7_b852]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771
BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_left,
BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_right,
BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_return_output);

-- n8_MUX_uxn_opcodes_h_l2437_c2_638b
n8_MUX_uxn_opcodes_h_l2437_c2_638b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2437_c2_638b_cond,
n8_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue,
n8_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse,
n8_MUX_uxn_opcodes_h_l2437_c2_638b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b
result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b
result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond,
result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b
result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b
result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_return_output);

-- t16_MUX_uxn_opcodes_h_l2437_c2_638b
t16_MUX_uxn_opcodes_h_l2437_c2_638b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2437_c2_638b_cond,
t16_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue,
t16_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse,
t16_MUX_uxn_opcodes_h_l2437_c2_638b_return_output);

-- printf_uxn_opcodes_h_l2438_c3_94d5_uxn_opcodes_h_l2438_c3_94d5
printf_uxn_opcodes_h_l2438_c3_94d5_uxn_opcodes_h_l2438_c3_94d5 : entity work.printf_uxn_opcodes_h_l2438_c3_94d5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2438_c3_94d5_uxn_opcodes_h_l2438_c3_94d5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_left,
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_right,
BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output);

-- n8_MUX_uxn_opcodes_h_l2442_c7_f2ac
n8_MUX_uxn_opcodes_h_l2442_c7_f2ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond,
n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue,
n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse,
n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac
result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond,
result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac
result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond,
result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output);

-- t16_MUX_uxn_opcodes_h_l2442_c7_f2ac
t16_MUX_uxn_opcodes_h_l2442_c7_f2ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond,
t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue,
t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse,
t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_left,
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_right,
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output);

-- n8_MUX_uxn_opcodes_h_l2445_c7_6905
n8_MUX_uxn_opcodes_h_l2445_c7_6905 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2445_c7_6905_cond,
n8_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue,
n8_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse,
n8_MUX_uxn_opcodes_h_l2445_c7_6905_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond,
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond,
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_return_output);

-- t16_MUX_uxn_opcodes_h_l2445_c7_6905
t16_MUX_uxn_opcodes_h_l2445_c7_6905 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2445_c7_6905_cond,
t16_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue,
t16_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse,
t16_MUX_uxn_opcodes_h_l2445_c7_6905_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c
CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_x,
CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_left,
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_right,
BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output);

-- n8_MUX_uxn_opcodes_h_l2450_c7_c5bd
n8_MUX_uxn_opcodes_h_l2450_c7_c5bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond,
n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue,
n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse,
n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond,
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output);

-- t16_MUX_uxn_opcodes_h_l2450_c7_c5bd
t16_MUX_uxn_opcodes_h_l2450_c7_c5bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond,
t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue,
t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse,
t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_left,
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_right,
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output);

-- n8_MUX_uxn_opcodes_h_l2453_c7_1282
n8_MUX_uxn_opcodes_h_l2453_c7_1282 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2453_c7_1282_cond,
n8_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue,
n8_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse,
n8_MUX_uxn_opcodes_h_l2453_c7_1282_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond,
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond,
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_return_output);

-- t16_MUX_uxn_opcodes_h_l2453_c7_1282
t16_MUX_uxn_opcodes_h_l2453_c7_1282 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2453_c7_1282_cond,
t16_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue,
t16_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse,
t16_MUX_uxn_opcodes_h_l2453_c7_1282_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02
BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_left,
BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_right,
BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_left,
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_right,
BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output);

-- n8_MUX_uxn_opcodes_h_l2457_c7_3b66
n8_MUX_uxn_opcodes_h_l2457_c7_3b66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2457_c7_3b66_cond,
n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue,
n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse,
n8_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66
result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond,
result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66
result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond,
result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66
result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_left,
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_right,
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output);

-- n8_MUX_uxn_opcodes_h_l2460_c7_7f4f
n8_MUX_uxn_opcodes_h_l2460_c7_7f4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond,
n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue,
n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse,
n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond,
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2463_c30_c791
sp_relative_shift_uxn_opcodes_h_l2463_c30_c791 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_ins,
sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_x,
sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_y,
sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_left,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_right,
BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852
result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_return_output,
 n8_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
 t16_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output,
 n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output,
 t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output,
 n8_MUX_uxn_opcodes_h_l2445_c7_6905_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_return_output,
 t16_MUX_uxn_opcodes_h_l2445_c7_6905_return_output,
 CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output,
 n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output,
 t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output,
 n8_MUX_uxn_opcodes_h_l2453_c7_1282_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_return_output,
 t16_MUX_uxn_opcodes_h_l2453_c7_1282_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output,
 n8_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output,
 n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output,
 sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2439_c3_2214 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2438_c3_94d5_uxn_opcodes_h_l2438_c3_94d5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2443_c3_a093 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_3eb0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2451_c3_c5cc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_07df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_dbf1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2457_c7_3b66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_57a4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_8262_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_ae2b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_93b9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_60f9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2460_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_e10f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2454_l2446_DUPLICATE_e85b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l2474_l2432_DUPLICATE_f949_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2451_c3_c5cc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2451_c3_c5cc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_07df := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2455_c3_07df;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2439_c3_2214 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2439_c3_2214;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2443_c3_a093 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2443_c3_a093;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_dbf1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_dbf1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_3eb0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2448_c3_3eb0;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2442_c11_2933] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_left;
     BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output := BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_57a4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_57a4_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2457_c11_b8c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2463_c30_c791] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_ins;
     sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_x;
     sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_return_output := sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_93b9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_93b9_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2460_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_e10f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2460_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_e10f_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_ae2b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_ae2b_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2460_c11_e06e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2468_c11_c839] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_left;
     BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_return_output := BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2453_c11_9eca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_left;
     BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output := BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2457_c7_3b66] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2457_c7_3b66_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_8262 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_8262_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2454_l2446_DUPLICATE_e85b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2454_l2446_DUPLICATE_e85b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2437_c6_2771] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_left;
     BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output := BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_60f9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_60f9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2445_c11_560e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2450_c11_570d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2437_c6_2771_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2442_c11_2933_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_560e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c11_570d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_9eca_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2457_c11_b8c3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_e06e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2468_c11_c839_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2454_l2446_DUPLICATE_e85b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2454_l2446_DUPLICATE_e85b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_93b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_93b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_93b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_93b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_93b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_93b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_93b9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_8262_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_8262_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_8262_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_8262_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_8262_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_8262_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_8262_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2460_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_e10f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2460_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_e10f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2460_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_e10f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2460_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_e10f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2460_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_e10f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2460_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_e10f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2460_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_e10f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_ae2b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_ae2b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_ae2b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_ae2b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_ae2b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_ae2b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_ae2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_60f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_60f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_60f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_60f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_60f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_60f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2437_l2457_l2453_l2450_l2445_l2442_l2468_DUPLICATE_60f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_57a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_57a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_57a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_57a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_57a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_57a4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2437_l2460_l2457_l2453_l2450_l2445_l2442_DUPLICATE_57a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2457_c7_3b66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2463_c30_c791_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2460_c7_7f4f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2468_c7_b852] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_return_output;

     -- n8_MUX[uxn_opcodes_h_l2460_c7_7f4f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond;
     n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue;
     n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output := n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2447_c3_ef5c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_return_output := CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2457_c7_3b66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2437_c1_ac85] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2468_c7_b852] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2460_c7_7f4f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2468_c7_b852] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2454_c3_0e02] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_left;
     BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_return_output := BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2460_c7_7f4f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output := result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2454_c3_0e02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2447_c3_ef5c_return_output;
     VAR_printf_uxn_opcodes_h_l2438_c3_94d5_uxn_opcodes_h_l2438_c3_94d5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2437_c1_ac85_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2468_c7_b852_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2468_c7_b852_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2468_c7_b852_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2460_c7_7f4f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2457_c7_3b66] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output := result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;

     -- t16_MUX[uxn_opcodes_h_l2453_c7_1282] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2453_c7_1282_cond <= VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_cond;
     t16_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue;
     t16_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_return_output := t16_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2457_c7_3b66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output := result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2457_c7_3b66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2460_c7_7f4f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;

     -- printf_uxn_opcodes_h_l2438_c3_94d5[uxn_opcodes_h_l2438_c3_94d5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2438_c3_94d5_uxn_opcodes_h_l2438_c3_94d5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2438_c3_94d5_uxn_opcodes_h_l2438_c3_94d5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2460_c7_7f4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2457_c7_3b66] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2457_c7_3b66_cond <= VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_cond;
     n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue;
     n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output := n8_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2453_c7_1282] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_7f4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2457_c7_3b66] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2457_c7_3b66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2457_c7_3b66] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2453_c7_1282] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;

     -- n8_MUX[uxn_opcodes_h_l2453_c7_1282] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2453_c7_1282_cond <= VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_cond;
     n8_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue;
     n8_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_return_output := n8_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;

     -- t16_MUX[uxn_opcodes_h_l2450_c7_c5bd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond;
     t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue;
     t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output := t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2453_c7_1282] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output := result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c7_c5bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2453_c7_1282] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output := result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2457_c7_3b66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2453_c7_1282] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2453_c7_1282] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;

     -- n8_MUX[uxn_opcodes_h_l2450_c7_c5bd] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond <= VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond;
     n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue;
     n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output := n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2453_c7_1282] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2445_c7_6905] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2450_c7_c5bd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output := result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c7_c5bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2450_c7_c5bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2445_c7_6905] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2445_c7_6905_cond <= VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_cond;
     t16_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue;
     t16_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_return_output := t16_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_1282_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2442_c7_f2ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c7_c5bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2442_c7_f2ac] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond <= VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond;
     t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue;
     t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output := t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2445_c7_6905] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output := result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c7_c5bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2445_c7_6905] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output := result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;

     -- n8_MUX[uxn_opcodes_h_l2445_c7_6905] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2445_c7_6905_cond <= VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_cond;
     n8_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue;
     n8_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_return_output := n8_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2445_c7_6905] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2450_c7_c5bd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c7_c5bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2445_c7_6905] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;

     -- t16_MUX[uxn_opcodes_h_l2437_c2_638b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2437_c2_638b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_cond;
     t16_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue;
     t16_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_return_output := t16_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2437_c2_638b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2442_c7_f2ac] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output := result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2445_c7_6905] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2442_c7_f2ac] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output := result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2442_c7_f2ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;

     -- n8_MUX[uxn_opcodes_h_l2442_c7_f2ac] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond <= VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond;
     n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue;
     n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output := n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2445_c7_6905] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_6905_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2437_c2_638b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2437_c2_638b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output := result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2442_c7_f2ac] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2442_c7_f2ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;

     -- n8_MUX[uxn_opcodes_h_l2437_c2_638b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2437_c2_638b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_cond;
     n8_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue;
     n8_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_return_output := n8_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2442_c7_f2ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2437_c2_638b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2442_c7_f2ac_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2437_c2_638b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2437_c2_638b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2437_c2_638b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l2474_l2432_DUPLICATE_f949 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l2474_l2432_DUPLICATE_f949_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_643c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2437_c2_638b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2437_c2_638b_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l2474_l2432_DUPLICATE_f949_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l2474_l2432_DUPLICATE_f949_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;

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
-- Submodules: 61
entity ovr_0CLK_a1f536f9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_a1f536f9;
architecture arch of ovr_0CLK_a1f536f9 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l301_c6_9bf7]
signal BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l301_c1_a715]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l301_c2_387c]
signal n8_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l301_c2_387c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l301_c2_387c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l301_c2_387c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l301_c2_387c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l301_c2_387c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l301_c2_387c]
signal result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l301_c2_387c]
signal t8_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l302_c3_3423[uxn_opcodes_h_l302_c3_3423]
signal printf_uxn_opcodes_h_l302_c3_3423_uxn_opcodes_h_l302_c3_3423_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l306_c11_c0fa]
signal BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l306_c7_3875]
signal n8_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l306_c7_3875]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l306_c7_3875]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l306_c7_3875]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l306_c7_3875]
signal result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l306_c7_3875]
signal result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l306_c7_3875]
signal result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l306_c7_3875]
signal t8_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l309_c11_373f]
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l309_c7_fe5e]
signal n8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l309_c7_fe5e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_fe5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l309_c7_fe5e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_fe5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_fe5e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l309_c7_fe5e]
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l309_c7_fe5e]
signal t8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l313_c11_c262]
signal BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l313_c7_80cb]
signal n8_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l313_c7_80cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l313_c7_80cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l313_c7_80cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l313_c7_80cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l313_c7_80cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l313_c7_80cb]
signal result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l316_c11_db97]
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l316_c7_eafa]
signal n8_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l316_c7_eafa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l316_c7_eafa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l316_c7_eafa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l316_c7_eafa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l316_c7_eafa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l316_c7_eafa]
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l319_c30_7e7b]
signal sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l324_c11_a82a]
signal BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l324_c7_7f00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l324_c7_7f00]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l324_c7_7f00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l324_c7_7f00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l324_c7_7f00]
signal result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l329_c11_2b57]
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_0432]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_0432]
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_0432]
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l329_c7_0432]
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l333_c11_2518]
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_21db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_21db]
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7
BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_left,
BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_right,
BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_return_output);

-- n8_MUX_uxn_opcodes_h_l301_c2_387c
n8_MUX_uxn_opcodes_h_l301_c2_387c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l301_c2_387c_cond,
n8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue,
n8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse,
n8_MUX_uxn_opcodes_h_l301_c2_387c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c
result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c
result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c
result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c
result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c
result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_cond,
result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_return_output);

-- t8_MUX_uxn_opcodes_h_l301_c2_387c
t8_MUX_uxn_opcodes_h_l301_c2_387c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l301_c2_387c_cond,
t8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue,
t8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse,
t8_MUX_uxn_opcodes_h_l301_c2_387c_return_output);

-- printf_uxn_opcodes_h_l302_c3_3423_uxn_opcodes_h_l302_c3_3423
printf_uxn_opcodes_h_l302_c3_3423_uxn_opcodes_h_l302_c3_3423 : entity work.printf_uxn_opcodes_h_l302_c3_3423_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l302_c3_3423_uxn_opcodes_h_l302_c3_3423_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa
BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_left,
BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_right,
BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output);

-- n8_MUX_uxn_opcodes_h_l306_c7_3875
n8_MUX_uxn_opcodes_h_l306_c7_3875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l306_c7_3875_cond,
n8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue,
n8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse,
n8_MUX_uxn_opcodes_h_l306_c7_3875_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875
result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875
result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875
result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875
result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875
result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_cond,
result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_return_output);

-- t8_MUX_uxn_opcodes_h_l306_c7_3875
t8_MUX_uxn_opcodes_h_l306_c7_3875 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l306_c7_3875_cond,
t8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue,
t8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse,
t8_MUX_uxn_opcodes_h_l306_c7_3875_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f
BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_left,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_right,
BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output);

-- n8_MUX_uxn_opcodes_h_l309_c7_fe5e
n8_MUX_uxn_opcodes_h_l309_c7_fe5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond,
n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue,
n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse,
n8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e
result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_cond,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output);

-- t8_MUX_uxn_opcodes_h_l309_c7_fe5e
t8_MUX_uxn_opcodes_h_l309_c7_fe5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond,
t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue,
t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse,
t8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262
BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_left,
BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_right,
BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output);

-- n8_MUX_uxn_opcodes_h_l313_c7_80cb
n8_MUX_uxn_opcodes_h_l313_c7_80cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l313_c7_80cb_cond,
n8_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue,
n8_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse,
n8_MUX_uxn_opcodes_h_l313_c7_80cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb
result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97
BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_left,
BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_right,
BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output);

-- n8_MUX_uxn_opcodes_h_l316_c7_eafa
n8_MUX_uxn_opcodes_h_l316_c7_eafa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l316_c7_eafa_cond,
n8_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue,
n8_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse,
n8_MUX_uxn_opcodes_h_l316_c7_eafa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa
result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_cond,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_return_output);

-- sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b
sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_ins,
sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_x,
sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_y,
sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a
BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_left,
BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_right,
BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00
result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_cond,
result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57
BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_left,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_right,
BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432
result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_cond,
result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518
BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_left,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_right,
BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_return_output,
 n8_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
 t8_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output,
 n8_MUX_uxn_opcodes_h_l306_c7_3875_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_return_output,
 t8_MUX_uxn_opcodes_h_l306_c7_3875_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output,
 n8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output,
 t8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output,
 n8_MUX_uxn_opcodes_h_l313_c7_80cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output,
 n8_MUX_uxn_opcodes_h_l316_c7_eafa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_return_output,
 sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l303_c3_ce24 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l302_c3_3423_uxn_opcodes_h_l302_c3_3423_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l307_c3_6259 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l311_c3_2773 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_ef59 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l321_c3_beee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_a140 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_ae64 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l329_c7_0432_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l316_DUPLICATE_3554_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_1b0c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_cc11_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_944f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l313_l309_l306_l333_l329_l324_l316_DUPLICATE_c24c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l338_l297_DUPLICATE_51c7_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l311_c3_2773 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l311_c3_2773;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_right := to_unsigned(6, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_ef59 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l314_c3_ef59;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l303_c3_ce24 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l303_c3_ce24;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l307_c3_6259 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l307_c3_6259;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_ae64 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l330_c3_ae64;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_a140 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l326_c3_a140;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l321_c3_beee := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l321_c3_beee;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse := n8;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l301_c6_9bf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l313_c11_c262] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_left;
     BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output := BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l324_c11_a82a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_left;
     BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output := BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l333_c11_2518] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_left;
     BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_return_output := BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l309_c11_373f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_left;
     BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output := BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l329_c7_0432] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l329_c7_0432_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_1b0c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_1b0c_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_944f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_944f_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l316_DUPLICATE_3554 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l316_DUPLICATE_3554_return_output := result.sp_relative_shift;

     -- sp_relative_shift[uxn_opcodes_h_l319_c30_7e7b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_ins;
     sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_x;
     sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_return_output := sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l313_l309_l306_l333_l329_l324_l316_DUPLICATE_c24c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l313_l309_l306_l333_l329_l324_l316_DUPLICATE_c24c_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_cc11 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_cc11_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l316_c11_db97] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_left;
     BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output := BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l329_c11_2b57] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_left;
     BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_return_output := BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l306_c11_c0fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l301_c6_9bf7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l306_c11_c0fa_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l309_c11_373f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l313_c11_c262_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l316_c11_db97_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l324_c11_a82a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l329_c11_2b57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l333_c11_2518_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l316_DUPLICATE_3554_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l316_DUPLICATE_3554_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l316_DUPLICATE_3554_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l316_DUPLICATE_3554_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l316_DUPLICATE_3554_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l313_l309_l306_l333_l329_l324_l316_DUPLICATE_c24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l313_l309_l306_l333_l329_l324_l316_DUPLICATE_c24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l313_l309_l306_l333_l329_l324_l316_DUPLICATE_c24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l313_l309_l306_l333_l329_l324_l316_DUPLICATE_c24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l313_l309_l306_l333_l329_l324_l316_DUPLICATE_c24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l313_l309_l306_l333_l329_l324_l316_DUPLICATE_c24c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l313_l309_l306_l333_l329_l324_l316_DUPLICATE_c24c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_1b0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_1b0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_1b0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_1b0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l313_l309_l306_l301_l324_DUPLICATE_1b0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_cc11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_cc11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_cc11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_cc11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_cc11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_cc11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l313_l309_l306_l333_l301_l329_l324_DUPLICATE_cc11_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_944f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_944f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_944f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_944f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l313_l309_l306_l301_l329_DUPLICATE_944f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l329_c7_0432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l319_c30_7e7b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l333_c7_21db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_return_output;

     -- n8_MUX[uxn_opcodes_h_l316_c7_eafa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l316_c7_eafa_cond <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_cond;
     n8_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue;
     n8_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_return_output := n8_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l329_c7_0432] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_cond;
     result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_return_output := result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_return_output;

     -- t8_MUX[uxn_opcodes_h_l309_c7_fe5e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond;
     t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue;
     t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output := t8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l333_c7_21db] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l324_c7_7f00] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l301_c1_a715] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l329_c7_0432] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l316_c7_eafa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l302_c3_3423_uxn_opcodes_h_l302_c3_3423_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l301_c1_a715_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l333_c7_21db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l324_c7_7f00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l333_c7_21db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l329_c7_0432_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l329_c7_0432_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse := VAR_t8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l324_c7_7f00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l313_c7_80cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;

     -- t8_MUX[uxn_opcodes_h_l306_c7_3875] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l306_c7_3875_cond <= VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_cond;
     t8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue;
     t8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_return_output := t8_MUX_uxn_opcodes_h_l306_c7_3875_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l316_c7_eafa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l324_c7_7f00] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_cond;
     result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_return_output := result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_return_output;

     -- printf_uxn_opcodes_h_l302_c3_3423[uxn_opcodes_h_l302_c3_3423] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l302_c3_3423_uxn_opcodes_h_l302_c3_3423_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l302_c3_3423_uxn_opcodes_h_l302_c3_3423_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l313_c7_80cb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l313_c7_80cb_cond <= VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_cond;
     n8_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue;
     n8_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_return_output := n8_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l329_c7_0432] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l329_c7_0432] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l329_c7_0432_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l329_c7_0432_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l324_c7_7f00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l324_c7_7f00_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l306_c7_3875_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l313_c7_80cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;

     -- t8_MUX[uxn_opcodes_h_l301_c2_387c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l301_c2_387c_cond <= VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_cond;
     t8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue;
     t8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_return_output := t8_MUX_uxn_opcodes_h_l301_c2_387c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l316_c7_eafa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;

     -- n8_MUX[uxn_opcodes_h_l309_c7_fe5e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_cond;
     n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue;
     n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output := n8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l316_c7_eafa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_return_output := result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l324_c7_7f00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l324_c7_7f00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l309_c7_fe5e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse := VAR_n8_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l324_c7_7f00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l324_c7_7f00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l301_c2_387c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l313_c7_80cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;

     -- n8_MUX[uxn_opcodes_h_l306_c7_3875] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l306_c7_3875_cond <= VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_cond;
     n8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_iftrue;
     n8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_return_output := n8_MUX_uxn_opcodes_h_l306_c7_3875_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l316_c7_eafa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l306_c7_3875] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l309_c7_fe5e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l316_c7_eafa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l313_c7_80cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse := VAR_n8_MUX_uxn_opcodes_h_l306_c7_3875_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l316_c7_eafa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l309_c7_fe5e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output := result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l306_c7_3875] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output;

     -- n8_MUX[uxn_opcodes_h_l301_c2_387c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l301_c2_387c_cond <= VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_cond;
     n8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_iftrue;
     n8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_return_output := n8_MUX_uxn_opcodes_h_l301_c2_387c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l309_c7_fe5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l301_c2_387c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l313_c7_80cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l313_c7_80cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l301_c2_387c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l306_c7_3875_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l313_c7_80cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l306_c7_3875] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l309_c7_fe5e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l301_c2_387c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l309_c7_fe5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l306_c7_3875] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_cond;
     result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_return_output := result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l309_c7_fe5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l306_c7_3875_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l306_c7_3875_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l306_c7_3875] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l306_c7_3875] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l301_c2_387c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l301_c2_387c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_return_output := result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l306_c7_3875_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l306_c7_3875_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l301_c2_387c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l301_c2_387c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l338_l297_DUPLICATE_51c7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l338_l297_DUPLICATE_51c7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l301_c2_387c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l301_c2_387c_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l338_l297_DUPLICATE_51c7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l338_l297_DUPLICATE_51c7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;

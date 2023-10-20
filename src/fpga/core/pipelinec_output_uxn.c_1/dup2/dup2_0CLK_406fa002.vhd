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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 68
entity dup2_0CLK_406fa002 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_406fa002;
architecture arch of dup2_0CLK_406fa002 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2989_c6_22eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2989_c2_f928]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2989_c2_f928]
signal result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2989_c2_f928]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2989_c2_f928]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2989_c2_f928]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2989_c2_f928]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2989_c2_f928]
signal t16_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2994_c11_8363]
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2994_c7_deab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2994_c7_deab]
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2994_c7_deab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2994_c7_deab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2994_c7_deab]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2994_c7_deab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2994_c7_deab]
signal t16_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2997_c11_4c4f]
signal BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2997_c7_578d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2997_c7_578d]
signal result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2997_c7_578d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2997_c7_578d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2997_c7_578d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2997_c7_578d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2997_c7_578d]
signal t16_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2999_c3_8bf8]
signal CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3002_c11_7690]
signal BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3002_c7_6b07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3002_c7_6b07]
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3002_c7_6b07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3002_c7_6b07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3002_c7_6b07]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3002_c7_6b07]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3002_c7_6b07]
signal t16_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3005_c11_a655]
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3005_c7_73b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3005_c7_73b0]
signal result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3005_c7_73b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3005_c7_73b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3005_c7_73b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3005_c7_73b0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3005_c7_73b0]
signal t16_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3006_c3_e4c2]
signal BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l3008_c30_3735]
signal sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3013_c11_7077]
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3013_c7_1284]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3013_c7_1284]
signal result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3013_c7_1284]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3013_c7_1284]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3013_c7_1284]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3018_c11_85f6]
signal BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3018_c7_bd7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3018_c7_bd7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3018_c7_bd7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3018_c7_bd7a]
signal result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3022_c11_77da]
signal BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3022_c7_4b09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3022_c7_4b09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3022_c7_4b09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3022_c7_4b09]
signal result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3026_c11_ca31]
signal BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3026_c7_7f4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3026_c7_7f4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb
BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928
result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_cond,
result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928
result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928
result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928
result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928
result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output);

-- t16_MUX_uxn_opcodes_h_l2989_c2_f928
t16_MUX_uxn_opcodes_h_l2989_c2_f928 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2989_c2_f928_cond,
t16_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue,
t16_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse,
t16_MUX_uxn_opcodes_h_l2989_c2_f928_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_left,
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_right,
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_cond,
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output);

-- t16_MUX_uxn_opcodes_h_l2994_c7_deab
t16_MUX_uxn_opcodes_h_l2994_c7_deab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2994_c7_deab_cond,
t16_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue,
t16_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse,
t16_MUX_uxn_opcodes_h_l2994_c7_deab_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f
BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_left,
BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_right,
BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d
result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d
result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d
result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d
result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output);

-- t16_MUX_uxn_opcodes_h_l2997_c7_578d
t16_MUX_uxn_opcodes_h_l2997_c7_578d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2997_c7_578d_cond,
t16_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue,
t16_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse,
t16_MUX_uxn_opcodes_h_l2997_c7_578d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8
CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_x,
CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_left,
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_right,
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_cond,
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output);

-- t16_MUX_uxn_opcodes_h_l3002_c7_6b07
t16_MUX_uxn_opcodes_h_l3002_c7_6b07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3002_c7_6b07_cond,
t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue,
t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse,
t16_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_left,
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_right,
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0
result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0
result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output);

-- t16_MUX_uxn_opcodes_h_l3005_c7_73b0
t16_MUX_uxn_opcodes_h_l3005_c7_73b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3005_c7_73b0_cond,
t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue,
t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse,
t16_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2
BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_left,
BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_right,
BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l3008_c30_3735
sp_relative_shift_uxn_opcodes_h_l3008_c30_3735 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_ins,
sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_x,
sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_y,
sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_left,
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_right,
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284
result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_cond,
result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284
result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6
BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_left,
BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_right,
BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a
result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a
result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a
result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da
BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_left,
BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_right,
BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09
result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09
result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09
result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_cond,
result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31
BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_left,
BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_right,
BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b
result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b
result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c
CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
 t16_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output,
 t16_MUX_uxn_opcodes_h_l2994_c7_deab_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output,
 t16_MUX_uxn_opcodes_h_l2997_c7_578d_return_output,
 CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output,
 t16_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output,
 t16_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_return_output,
 sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2991_c3_fe19 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2995_c3_d33a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3000_c3_251b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3003_c3_8bd2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_0b7f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c21_f56c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3015_c3_3fdc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3019_c3_6db5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3020_c21_d4eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3023_c3_a502 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3022_c7_4b09_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2997_l2994_l3022_l2989_l3002_DUPLICATE_0764_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3005_l3002_DUPLICATE_89e7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3013_l3002_DUPLICATE_6be2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2998_l3006_DUPLICATE_0296_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_6dec_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l3031_l2985_DUPLICATE_ab25_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_0b7f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_0b7f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3023_c3_a502 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3023_c3_a502;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2991_c3_fe19 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2991_c3_fe19;
     VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3000_c3_251b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3000_c3_251b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3015_c3_3fdc := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3015_c3_3fdc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3019_c3_6db5 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3019_c3_6db5;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2995_c3_d33a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2995_c3_d33a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3003_c3_8bd2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3003_c3_8bd2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse := t16;
     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3022_c7_4b09] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3022_c7_4b09_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3002_c11_7690] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_left;
     BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output := BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2997_l2994_l3022_l2989_l3002_DUPLICATE_0764 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2997_l2994_l3022_l2989_l3002_DUPLICATE_0764_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3013_l3002_DUPLICATE_6be2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3013_l3002_DUPLICATE_6be2_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3018_c11_85f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3020_c21_d4eb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3020_c21_d4eb_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3005_l3002_DUPLICATE_89e7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3005_l3002_DUPLICATE_89e7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2989_c6_22eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3026_c11_ca31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_left;
     BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_return_output := BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3022_c11_77da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_left;
     BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_return_output := BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3005_c11_a655] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_left;
     BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output := BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de_return_output := result.is_stack_write;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2997_c11_4c4f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2994_c11_8363] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_left;
     BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output := BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3013_c11_7077] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_left;
     BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output := BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l3008_c30_3735] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_ins;
     sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_x <= VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_x;
     sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_y <= VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_return_output := sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2998_l3006_DUPLICATE_0296 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2998_l3006_DUPLICATE_0296_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2989_c6_22eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_8363_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2997_c11_4c4f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_7690_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_a655_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_7077_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3018_c11_85f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3022_c11_77da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3026_c11_ca31_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2998_l3006_DUPLICATE_0296_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2998_l3006_DUPLICATE_0296_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3020_c21_d4eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3005_l3002_DUPLICATE_89e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3005_l3002_DUPLICATE_89e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3005_l3002_DUPLICATE_89e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3005_l3002_DUPLICATE_89e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3005_l3002_DUPLICATE_89e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l3018_l3013_l3005_l3002_DUPLICATE_f186_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3013_l3002_DUPLICATE_6be2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3013_l3002_DUPLICATE_6be2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3013_l3002_DUPLICATE_6be2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3013_l3002_DUPLICATE_6be2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2997_l2994_l2989_l3013_l3002_DUPLICATE_6be2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2997_l3026_l2994_l3022_l2989_l3018_l3013_l3002_DUPLICATE_58de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2997_l2994_l3022_l2989_l3002_DUPLICATE_0764_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2997_l2994_l3022_l2989_l3002_DUPLICATE_0764_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2997_l2994_l3022_l2989_l3002_DUPLICATE_0764_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2997_l2994_l3022_l2989_l3002_DUPLICATE_0764_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2997_l2994_l3022_l2989_l3002_DUPLICATE_0764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3022_c7_4b09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l3008_c30_3735_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l3006_c3_e4c2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_left;
     BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_return_output := BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3013_c7_1284] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3005_c7_73b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2999_c3_8bf8] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_return_output := CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3022_c7_4b09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_6dec LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_6dec_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_561c_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3026_c7_7f4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3026_c7_7f4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_6dec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3024_l3016_DUPLICATE_6dec_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2999_c3_8bf8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_1284_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3026_c7_7f4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l3022_c7_4b09] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output := result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3022_c7_4b09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3022_c7_4b09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3005_c7_73b0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3011_c21_f56c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c21_f56c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l3006_c3_e4c2_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3018_c7_bd7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3002_c7_6b07] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;

     -- t16_MUX[uxn_opcodes_h_l3005_c7_73b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3005_c7_73b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_cond;
     t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue;
     t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output := t16_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c21_f56c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3022_c7_4b09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l3018_c7_bd7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3013_c7_1284] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3002_c7_6b07] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;

     -- t16_MUX[uxn_opcodes_h_l3002_c7_6b07] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3002_c7_6b07_cond <= VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_cond;
     t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue;
     t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output := t16_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2997_c7_578d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3018_c7_bd7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3018_c7_bd7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_1284_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3018_c7_bd7a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2994_c7_deab] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2997_c7_578d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3013_c7_1284] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3013_c7_1284] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_return_output := result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3005_c7_73b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2997_c7_578d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2997_c7_578d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_cond;
     t16_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue;
     t16_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_return_output := t16_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3013_c7_1284] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_1284_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_1284_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3013_c7_1284_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l3005_c7_73b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3005_c7_73b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2994_c7_deab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2989_c2_f928] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3002_c7_6b07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3005_c7_73b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2994_c7_deab] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2994_c7_deab_cond <= VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_cond;
     t16_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue;
     t16_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_return_output := t16_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3005_c7_73b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3002_c7_6b07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2989_c2_f928] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output;

     -- t16_MUX[uxn_opcodes_h_l2989_c2_f928] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2989_c2_f928_cond <= VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_cond;
     t16_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue;
     t16_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_return_output := t16_MUX_uxn_opcodes_h_l2989_c2_f928_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3002_c7_6b07] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output := result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3002_c7_6b07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2997_c7_578d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_6b07_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2989_c2_f928_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2997_c7_578d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2994_c7_deab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2997_c7_578d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2997_c7_578d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2997_c7_578d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2994_c7_deab] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_return_output := result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2994_c7_deab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2994_c7_deab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2989_c2_f928] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_deab_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2989_c2_f928] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_return_output := result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2989_c2_f928] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2989_c2_f928] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l3031_l2985_DUPLICATE_ab25 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l3031_l2985_DUPLICATE_ab25_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2989_c2_f928_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l3031_l2985_DUPLICATE_ab25_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l3031_l2985_DUPLICATE_ab25_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;

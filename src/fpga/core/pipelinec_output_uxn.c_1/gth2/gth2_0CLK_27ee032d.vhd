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
-- Submodules: 89
entity gth2_0CLK_27ee032d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_27ee032d;
architecture arch of gth2_0CLK_27ee032d is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1955_c6_2852]
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1955_c2_f92f]
signal n16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1955_c2_f92f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1955_c2_f92f]
signal result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1955_c2_f92f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1955_c2_f92f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1955_c2_f92f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1955_c2_f92f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1955_c2_f92f]
signal t16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_cb55]
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1960_c7_2bb7]
signal n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_2bb7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1960_c7_2bb7]
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_2bb7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_2bb7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_2bb7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_2bb7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1960_c7_2bb7]
signal t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_a3e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1963_c7_ca73]
signal n16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_ca73]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1963_c7_ca73]
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_ca73]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_ca73]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_ca73]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1963_c7_ca73]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1963_c7_ca73]
signal t16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_c453]
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1968_c7_a880]
signal n16_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_a880]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1968_c7_a880]
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_a880]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_a880]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_a880]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1968_c7_a880]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1968_c7_a880]
signal t16_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1971_c11_c9d7]
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1971_c7_f158]
signal n16_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1971_c7_f158]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1971_c7_f158]
signal result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1971_c7_f158]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1971_c7_f158]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1971_c7_f158]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1971_c7_f158]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1971_c7_f158]
signal t16_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1972_c3_2e83]
signal BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_c0c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1975_c7_7b07]
signal n16_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_7b07]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1975_c7_7b07]
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_7b07]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_7b07]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1975_c7_7b07]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_7b07]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1978_c11_439b]
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1978_c7_9141]
signal n16_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1978_c7_9141]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1978_c7_9141]
signal result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1978_c7_9141]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1978_c7_9141]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1978_c7_9141]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1978_c7_9141]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1983_c11_2e40]
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1983_c7_e330]
signal n16_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1983_c7_e330]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1983_c7_e330]
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1983_c7_e330]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1983_c7_e330]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1983_c7_e330]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1983_c7_e330]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1986_c11_c011]
signal BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1986_c7_20cb]
signal n16_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1986_c7_20cb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1986_c7_20cb]
signal result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1986_c7_20cb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1986_c7_20cb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1986_c7_20cb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1986_c7_20cb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1987_c3_f256]
signal BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1989_c30_0a82]
signal sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1992_c21_84fb]
signal BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1992_c21_99b5]
signal MUX_uxn_opcodes_h_l1992_c21_99b5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1992_c21_99b5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1992_c21_99b5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1992_c21_99b5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1994_c11_70b7]
signal BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1994_c7_82a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1994_c7_82a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1994_c7_82a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_left,
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_right,
BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output);

-- n16_MUX_uxn_opcodes_h_l1955_c2_f92f
n16_MUX_uxn_opcodes_h_l1955_c2_f92f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond,
n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue,
n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse,
n16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f
result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output);

-- t16_MUX_uxn_opcodes_h_l1955_c2_f92f
t16_MUX_uxn_opcodes_h_l1955_c2_f92f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond,
t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue,
t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse,
t16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_left,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_right,
BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output);

-- n16_MUX_uxn_opcodes_h_l1960_c7_2bb7
n16_MUX_uxn_opcodes_h_l1960_c7_2bb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond,
n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue,
n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse,
n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output);

-- t16_MUX_uxn_opcodes_h_l1960_c7_2bb7
t16_MUX_uxn_opcodes_h_l1960_c7_2bb7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond,
t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue,
t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse,
t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output);

-- n16_MUX_uxn_opcodes_h_l1963_c7_ca73
n16_MUX_uxn_opcodes_h_l1963_c7_ca73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond,
n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue,
n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse,
n16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_cond,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output);

-- t16_MUX_uxn_opcodes_h_l1963_c7_ca73
t16_MUX_uxn_opcodes_h_l1963_c7_ca73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond,
t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue,
t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse,
t16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_left,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_right,
BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output);

-- n16_MUX_uxn_opcodes_h_l1968_c7_a880
n16_MUX_uxn_opcodes_h_l1968_c7_a880 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1968_c7_a880_cond,
n16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue,
n16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse,
n16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_cond,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output);

-- t16_MUX_uxn_opcodes_h_l1968_c7_a880
t16_MUX_uxn_opcodes_h_l1968_c7_a880 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1968_c7_a880_cond,
t16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue,
t16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse,
t16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_left,
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_right,
BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output);

-- n16_MUX_uxn_opcodes_h_l1971_c7_f158
n16_MUX_uxn_opcodes_h_l1971_c7_f158 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1971_c7_f158_cond,
n16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue,
n16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse,
n16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158
result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_cond,
result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output);

-- t16_MUX_uxn_opcodes_h_l1971_c7_f158
t16_MUX_uxn_opcodes_h_l1971_c7_f158 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1971_c7_f158_cond,
t16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue,
t16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse,
t16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83
BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_left,
BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_right,
BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output);

-- n16_MUX_uxn_opcodes_h_l1975_c7_7b07
n16_MUX_uxn_opcodes_h_l1975_c7_7b07 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1975_c7_7b07_cond,
n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue,
n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse,
n16_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_cond,
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_left,
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_right,
BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output);

-- n16_MUX_uxn_opcodes_h_l1978_c7_9141
n16_MUX_uxn_opcodes_h_l1978_c7_9141 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1978_c7_9141_cond,
n16_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue,
n16_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse,
n16_MUX_uxn_opcodes_h_l1978_c7_9141_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141
result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_cond,
result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141
result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_left,
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_right,
BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output);

-- n16_MUX_uxn_opcodes_h_l1983_c7_e330
n16_MUX_uxn_opcodes_h_l1983_c7_e330 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1983_c7_e330_cond,
n16_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue,
n16_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse,
n16_MUX_uxn_opcodes_h_l1983_c7_e330_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_cond,
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011
BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_left,
BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_right,
BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output);

-- n16_MUX_uxn_opcodes_h_l1986_c7_20cb
n16_MUX_uxn_opcodes_h_l1986_c7_20cb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1986_c7_20cb_cond,
n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue,
n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse,
n16_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb
result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_cond,
result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb
result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256
BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_left,
BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_right,
BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82
sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_ins,
sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_x,
sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_y,
sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb
BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_left,
BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_right,
BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_return_output);

-- MUX_uxn_opcodes_h_l1992_c21_99b5
MUX_uxn_opcodes_h_l1992_c21_99b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1992_c21_99b5_cond,
MUX_uxn_opcodes_h_l1992_c21_99b5_iftrue,
MUX_uxn_opcodes_h_l1992_c21_99b5_iffalse,
MUX_uxn_opcodes_h_l1992_c21_99b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_left,
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_right,
BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329
CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output,
 n16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
 t16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output,
 n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output,
 t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output,
 n16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output,
 t16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output,
 n16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output,
 t16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output,
 n16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output,
 t16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output,
 n16_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output,
 n16_MUX_uxn_opcodes_h_l1978_c7_9141_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output,
 n16_MUX_uxn_opcodes_h_l1983_c7_e330_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output,
 n16_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_return_output,
 sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_return_output,
 MUX_uxn_opcodes_h_l1992_c21_99b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_ec03 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_c928 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_7333 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_7cc1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_54d1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1976_c3_c4f0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_d3be : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1984_c3_7373 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_a5d6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1986_c7_20cb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1979_l1987_l1972_DUPLICATE_2341_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1951_l2000_DUPLICATE_85b7_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_a5d6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1991_c3_a5d6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_54d1 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1973_c3_54d1;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_ec03 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1957_c3_ec03;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_d3be := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1981_c3_d3be;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_7333 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1966_c3_7333;
     VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1976_c3_c4f0 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1976_c3_c4f0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1984_c3_7373 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1984_c3_7373;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_7cc1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1969_c3_7cc1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_c928 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1961_c3_c928;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_right := to_unsigned(4, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1994_c11_70b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1960_c11_cb55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_left;
     BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output := BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1978_c11_439b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1989_c30_0a82] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_ins;
     sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_x;
     sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_return_output := sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1983_c11_2e40] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_left;
     BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output := BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1986_c11_c011] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_left;
     BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output := BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1975_c11_c0c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1979_l1987_l1972_DUPLICATE_2341 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1979_l1987_l1972_DUPLICATE_2341_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1986_c7_20cb] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1986_c7_20cb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1968_c11_c453] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_left;
     BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output := BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1971_c11_c9d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1955_c6_2852] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_left;
     BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output := BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1963_c11_a3e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1955_c6_2852_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1960_c11_cb55_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1963_c11_a3e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1968_c11_c453_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1971_c11_c9d7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1975_c11_c0c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1978_c11_439b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1983_c11_2e40_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1986_c11_c011_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1994_c11_70b7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1979_l1987_l1972_DUPLICATE_2341_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1979_l1987_l1972_DUPLICATE_2341_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1964_l1979_l1987_l1972_DUPLICATE_2341_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_def0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1978_l1975_l1971_l1994_l1968_DUPLICATE_2486_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_6774_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1963_l1960_l1983_l1955_l1978_l1975_l1971_l1994_l1968_DUPLICATE_58f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1963_l1986_l1960_l1983_l1955_l1978_l1975_l1971_l1968_DUPLICATE_ae88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1986_c7_20cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1989_c30_0a82_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l1987_c3_f256] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_left;
     BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_return_output := BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1994_c7_82a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1994_c7_82a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1986_c7_20cb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1986_c7_20cb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1994_c7_82a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1972_c3_2e83] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_left;
     BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_return_output := BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1972_c3_2e83_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1987_c3_f256_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1965_l1980_DUPLICATE_0329_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1994_c7_82a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1986_c7_20cb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1983_c7_e330] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1983_c7_e330] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;

     -- t16_MUX[uxn_opcodes_h_l1971_c7_f158] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1971_c7_f158_cond <= VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_cond;
     t16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue;
     t16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output := t16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1992_c21_84fb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_left;
     BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_return_output := BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1986_c7_20cb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1986_c7_20cb_cond <= VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_cond;
     n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue;
     n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output := n16_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1986_c7_20cb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1986_c7_20cb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1992_c21_84fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1983_c7_e330] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1983_c7_e330] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;

     -- t16_MUX[uxn_opcodes_h_l1968_c7_a880] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1968_c7_a880_cond <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_cond;
     t16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue;
     t16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output := t16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1978_c7_9141] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;

     -- MUX[uxn_opcodes_h_l1992_c21_99b5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1992_c21_99b5_cond <= VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_cond;
     MUX_uxn_opcodes_h_l1992_c21_99b5_iftrue <= VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_iftrue;
     MUX_uxn_opcodes_h_l1992_c21_99b5_iffalse <= VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_return_output := MUX_uxn_opcodes_h_l1992_c21_99b5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1983_c7_e330] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1983_c7_e330_cond <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_cond;
     n16_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue;
     n16_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_return_output := n16_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1978_c7_9141] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1983_c7_e330] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue := VAR_MUX_uxn_opcodes_h_l1992_c21_99b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1975_c7_7b07] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1978_c7_9141] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1978_c7_9141] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1986_c7_20cb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output := result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;

     -- n16_MUX[uxn_opcodes_h_l1978_c7_9141] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1978_c7_9141_cond <= VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_cond;
     n16_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue;
     n16_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_return_output := n16_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;

     -- t16_MUX[uxn_opcodes_h_l1963_c7_ca73] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond;
     t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue;
     t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output := t16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1978_c7_9141] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1975_c7_7b07] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1986_c7_20cb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1975_c7_7b07] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1971_c7_f158] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1971_c7_f158] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;

     -- t16_MUX[uxn_opcodes_h_l1960_c7_2bb7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond;
     t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue;
     t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output := t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1983_c7_e330] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_return_output := result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1975_c7_7b07] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;

     -- n16_MUX[uxn_opcodes_h_l1975_c7_7b07] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1975_c7_7b07_cond <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_cond;
     n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue;
     n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output := n16_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1975_c7_7b07] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1983_c7_e330_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1978_c7_9141] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_return_output := result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1968_c7_a880] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1968_c7_a880] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1971_c7_f158] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;

     -- n16_MUX[uxn_opcodes_h_l1971_c7_f158] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1971_c7_f158_cond <= VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_cond;
     n16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue;
     n16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output := n16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;

     -- t16_MUX[uxn_opcodes_h_l1955_c2_f92f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond;
     t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue;
     t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output := t16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1971_c7_f158] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1971_c7_f158] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1978_c7_9141_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1968_c7_a880] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;

     -- n16_MUX[uxn_opcodes_h_l1968_c7_a880] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1968_c7_a880_cond <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_cond;
     n16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue;
     n16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output := n16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1963_c7_ca73] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1963_c7_ca73] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1975_c7_7b07] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output := result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1968_c7_a880] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1968_c7_a880] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1975_c7_7b07_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1963_c7_ca73] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1963_c7_ca73] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1960_c7_2bb7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1960_c7_2bb7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1971_c7_f158] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_return_output := result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1963_c7_ca73] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;

     -- n16_MUX[uxn_opcodes_h_l1963_c7_ca73] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_cond;
     n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue;
     n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output := n16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1971_c7_f158_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1955_c2_f92f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1960_c7_2bb7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;

     -- n16_MUX[uxn_opcodes_h_l1960_c7_2bb7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond;
     n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue;
     n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output := n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1960_c7_2bb7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1968_c7_a880] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_return_output := result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1955_c2_f92f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1960_c7_2bb7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1968_c7_a880_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1955_c2_f92f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1955_c2_f92f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_cond;
     n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue;
     n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output := n16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1963_c7_ca73] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output := result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1955_c2_f92f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1955_c2_f92f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1963_c7_ca73_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1960_c7_2bb7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1960_c7_2bb7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1955_c2_f92f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1951_l2000_DUPLICATE_85b7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1951_l2000_DUPLICATE_85b7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1955_c2_f92f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1951_l2000_DUPLICATE_85b7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l1951_l2000_DUPLICATE_85b7_return_output;
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

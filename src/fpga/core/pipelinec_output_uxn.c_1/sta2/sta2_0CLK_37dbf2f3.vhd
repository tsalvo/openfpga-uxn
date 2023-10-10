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
-- Submodules: 117
entity sta2_0CLK_37dbf2f3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_37dbf2f3;
architecture arch of sta2_0CLK_37dbf2f3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2647_c6_60aa]
signal BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2647_c1_d744]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2647_c2_328b]
signal n16_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2647_c2_328b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2647_c2_328b]
signal result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2647_c2_328b]
signal result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2647_c2_328b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2647_c2_328b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2647_c2_328b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2647_c2_328b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2647_c2_328b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2647_c2_328b]
signal t16_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2648_c3_65ff[uxn_opcodes_h_l2648_c3_65ff]
signal printf_uxn_opcodes_h_l2648_c3_65ff_uxn_opcodes_h_l2648_c3_65ff_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2653_c11_150a]
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2653_c7_8b3c]
signal n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2653_c7_8b3c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2653_c7_8b3c]
signal result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2653_c7_8b3c]
signal result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c7_8b3c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c7_8b3c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c7_8b3c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2653_c7_8b3c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c7_8b3c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2653_c7_8b3c]
signal t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2656_c11_1cdb]
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2656_c7_e98f]
signal n16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2656_c7_e98f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2656_c7_e98f]
signal result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2656_c7_e98f]
signal result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2656_c7_e98f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2656_c7_e98f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2656_c7_e98f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2656_c7_e98f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2656_c7_e98f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2656_c7_e98f]
signal t16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_283f]
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2661_c7_33bc]
signal n16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2661_c7_33bc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2661_c7_33bc]
signal result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2661_c7_33bc]
signal result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_33bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_33bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_33bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2661_c7_33bc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_33bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2661_c7_33bc]
signal t16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2664_c11_f785]
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2664_c7_ffbe]
signal n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2664_c7_ffbe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2664_c7_ffbe]
signal result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2664_c7_ffbe]
signal result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2664_c7_ffbe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2664_c7_ffbe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2664_c7_ffbe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2664_c7_ffbe]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2664_c7_ffbe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2664_c7_ffbe]
signal t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2665_c3_a1f7]
signal BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2668_c11_078e]
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2668_c7_d0d0]
signal n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2668_c7_d0d0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2668_c7_d0d0]
signal result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2668_c7_d0d0]
signal result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2668_c7_d0d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2668_c7_d0d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2668_c7_d0d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2668_c7_d0d0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2668_c7_d0d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2671_c11_1a78]
signal BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2671_c7_aa05]
signal n16_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2671_c7_aa05]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2671_c7_aa05]
signal result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2671_c7_aa05]
signal result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2671_c7_aa05]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2671_c7_aa05]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2671_c7_aa05]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2671_c7_aa05]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2671_c7_aa05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2676_c11_2e9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2676_c7_90b5]
signal n16_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2676_c7_90b5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2676_c7_90b5]
signal result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2676_c7_90b5]
signal result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2676_c7_90b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2676_c7_90b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2676_c7_90b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2676_c7_90b5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2676_c7_90b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2679_c11_e1e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2679_c7_9be4]
signal n16_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2679_c7_9be4]
signal result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2679_c7_9be4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2679_c7_9be4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2679_c7_9be4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2679_c7_9be4]
signal result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2679_c7_9be4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2679_c7_9be4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2680_c3_587a]
signal BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2683_c32_f3f3]
signal BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2683_c32_abdb]
signal BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2683_c32_cd6a]
signal MUX_uxn_opcodes_h_l2683_c32_cd6a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2683_c32_cd6a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2683_c32_cd6a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2683_c32_cd6a_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2686_c32_fc3f]
signal CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2688_c11_a1f0]
signal BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2688_c7_96e0]
signal result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2688_c7_96e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2688_c7_96e0]
signal result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2688_c7_96e0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2688_c7_96e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2690_c21_3c99]
signal BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_0269]
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2693_c7_8860]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_8860]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_475e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.ram_value := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa
BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_left,
BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_right,
BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_return_output);

-- n16_MUX_uxn_opcodes_h_l2647_c2_328b
n16_MUX_uxn_opcodes_h_l2647_c2_328b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2647_c2_328b_cond,
n16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue,
n16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse,
n16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b
result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b
result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_cond,
result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b
result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b
result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b
result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b
result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

-- t16_MUX_uxn_opcodes_h_l2647_c2_328b
t16_MUX_uxn_opcodes_h_l2647_c2_328b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2647_c2_328b_cond,
t16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue,
t16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse,
t16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

-- printf_uxn_opcodes_h_l2648_c3_65ff_uxn_opcodes_h_l2648_c3_65ff
printf_uxn_opcodes_h_l2648_c3_65ff_uxn_opcodes_h_l2648_c3_65ff : entity work.printf_uxn_opcodes_h_l2648_c3_65ff_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2648_c3_65ff_uxn_opcodes_h_l2648_c3_65ff_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_left,
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_right,
BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output);

-- n16_MUX_uxn_opcodes_h_l2653_c7_8b3c
n16_MUX_uxn_opcodes_h_l2653_c7_8b3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond,
n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue,
n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse,
n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c
result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c
result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond,
result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c
result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c
result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output);

-- t16_MUX_uxn_opcodes_h_l2653_c7_8b3c
t16_MUX_uxn_opcodes_h_l2653_c7_8b3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond,
t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue,
t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse,
t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_left,
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_right,
BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output);

-- n16_MUX_uxn_opcodes_h_l2656_c7_e98f
n16_MUX_uxn_opcodes_h_l2656_c7_e98f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond,
n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue,
n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse,
n16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f
result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f
result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_cond,
result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f
result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f
result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output);

-- t16_MUX_uxn_opcodes_h_l2656_c7_e98f
t16_MUX_uxn_opcodes_h_l2656_c7_e98f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond,
t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue,
t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse,
t16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_left,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_right,
BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output);

-- n16_MUX_uxn_opcodes_h_l2661_c7_33bc
n16_MUX_uxn_opcodes_h_l2661_c7_33bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond,
n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue,
n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse,
n16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc
result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc
result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_cond,
result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc
result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc
result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output);

-- t16_MUX_uxn_opcodes_h_l2661_c7_33bc
t16_MUX_uxn_opcodes_h_l2661_c7_33bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond,
t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue,
t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse,
t16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_left,
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_right,
BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output);

-- n16_MUX_uxn_opcodes_h_l2664_c7_ffbe
n16_MUX_uxn_opcodes_h_l2664_c7_ffbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond,
n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue,
n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse,
n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe
result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe
result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond,
result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe
result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe
result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output);

-- t16_MUX_uxn_opcodes_h_l2664_c7_ffbe
t16_MUX_uxn_opcodes_h_l2664_c7_ffbe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond,
t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue,
t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse,
t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7
BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_left,
BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_right,
BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_left,
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_right,
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output);

-- n16_MUX_uxn_opcodes_h_l2668_c7_d0d0
n16_MUX_uxn_opcodes_h_l2668_c7_d0d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond,
n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue,
n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse,
n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0
result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0
result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond,
result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0
result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0
result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0
result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78
BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_left,
BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_right,
BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output);

-- n16_MUX_uxn_opcodes_h_l2671_c7_aa05
n16_MUX_uxn_opcodes_h_l2671_c7_aa05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2671_c7_aa05_cond,
n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue,
n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse,
n16_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05
result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05
result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_cond,
result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05
result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05
result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output);

-- n16_MUX_uxn_opcodes_h_l2676_c7_90b5
n16_MUX_uxn_opcodes_h_l2676_c7_90b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2676_c7_90b5_cond,
n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue,
n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse,
n16_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5
result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5
result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_cond,
result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5
result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5
result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output);

-- n16_MUX_uxn_opcodes_h_l2679_c7_9be4
n16_MUX_uxn_opcodes_h_l2679_c7_9be4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2679_c7_9be4_cond,
n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue,
n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse,
n16_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4
result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4
result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4
result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4
result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_cond,
result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4
result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a
BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_left,
BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_right,
BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3
BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_left,
BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_right,
BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb
BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_left,
BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_right,
BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_return_output);

-- MUX_uxn_opcodes_h_l2683_c32_cd6a
MUX_uxn_opcodes_h_l2683_c32_cd6a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2683_c32_cd6a_cond,
MUX_uxn_opcodes_h_l2683_c32_cd6a_iftrue,
MUX_uxn_opcodes_h_l2683_c32_cd6a_iffalse,
MUX_uxn_opcodes_h_l2683_c32_cd6a_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f
CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_x,
CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_left,
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_right,
BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0
result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0
result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0
result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_cond,
result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0
result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0
result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99
BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_left,
BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_right,
BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_left,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_right,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860
result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6
CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_return_output,
 n16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
 t16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output,
 n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output,
 t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output,
 n16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output,
 t16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output,
 n16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output,
 t16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output,
 n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output,
 t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output,
 n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output,
 n16_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output,
 n16_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output,
 n16_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_return_output,
 MUX_uxn_opcodes_h_l2683_c32_cd6a_return_output,
 CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_ab73 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2648_c3_65ff_uxn_opcodes_h_l2648_c3_65ff_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2654_c3_f0a2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_54fc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_3564 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_90ed : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_73cb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_b8d4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2677_c3_4aa9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2676_c7_90b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_return_output : signed(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2686_c22_b120_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2690_c3_3574 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c22_dbb1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2672_l2665_l2680_DUPLICATE_df91_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l2698_l2643_DUPLICATE_93c9_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_iffalse := resize(to_signed(-4, 4), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_right := to_unsigned(9, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_b8d4 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2674_c3_b8d4;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_3564 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_3564;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2677_c3_4aa9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2677_c3_4aa9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_ab73 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2650_c3_ab73;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_right := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_90ed := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_90ed;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_73cb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2669_c3_73cb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2654_c3_f0a2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2654_c3_f0a2;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_54fc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2659_c3_54fc;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse := t16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2661_c11_283f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2664_c11_f785] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_left;
     BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output := BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output := result.ram_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2653_c11_150a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2688_c11_a1f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da_return_output := result.is_stack_read;

     -- BIN_OP_AND[uxn_opcodes_h_l2683_c32_f3f3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_left;
     BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_return_output := BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_0269] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_left;
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_return_output := BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2671_c11_1a78] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_left;
     BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output := BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2691_c22_dbb1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c22_dbb1_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l2647_c6_60aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2676_c11_2e9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2679_c11_e1e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2668_c11_078e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2676_c7_90b5] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2676_c7_90b5_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2656_c11_1cdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2672_l2665_l2680_DUPLICATE_df91 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2672_l2665_l2680_DUPLICATE_df91_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_PLUS[uxn_opcodes_h_l2690_c21_3c99] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2683_c32_f3f3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2647_c6_60aa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2653_c11_150a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2656_c11_1cdb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2661_c11_283f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2664_c11_f785_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_078e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2671_c11_1a78_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2676_c11_2e9f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2679_c11_e1e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2688_c11_a1f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_0269_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2690_c3_3574 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2690_c21_3c99_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2672_l2665_l2680_DUPLICATE_df91_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2672_l2665_l2680_DUPLICATE_df91_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2657_l2672_l2665_l2680_DUPLICATE_df91_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2691_c22_dbb1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_03f6_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_ac7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2688_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2693_l2661_DUPLICATE_eecc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2693_l2661_DUPLICATE_6622_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_4899_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2656_l2679_l2653_l2676_l2671_l2668_l2664_l2661_DUPLICATE_c2da_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2688_l2656_l2653_l2676_l2647_l2671_l2668_l2664_l2661_DUPLICATE_0575_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2676_c7_90b5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2690_c3_3574;
     -- BIN_OP_OR[uxn_opcodes_h_l2665_c3_a1f7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_left;
     BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_return_output := BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2688_c7_96e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2679_c7_9be4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2647_c1_d744] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2683_c32_abdb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_left;
     BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_return_output := BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2676_c7_90b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2688_c7_96e0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2688_c7_96e0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output := result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2680_c3_587a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_left;
     BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_return_output := BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2693_c7_8860] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_8860] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2683_c32_abdb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2665_c3_a1f7_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2680_c3_587a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2673_l2658_DUPLICATE_d8f6_return_output;
     VAR_printf_uxn_opcodes_h_l2648_c3_65ff_uxn_opcodes_h_l2648_c3_65ff_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2647_c1_d744_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_8860_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2693_c7_8860_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2676_c7_90b5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2679_c7_9be4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2688_c7_96e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2671_c7_aa05] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;

     -- MUX[uxn_opcodes_h_l2683_c32_cd6a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2683_c32_cd6a_cond <= VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_cond;
     MUX_uxn_opcodes_h_l2683_c32_cd6a_iftrue <= VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_iftrue;
     MUX_uxn_opcodes_h_l2683_c32_cd6a_iffalse <= VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_return_output := MUX_uxn_opcodes_h_l2683_c32_cd6a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2679_c7_9be4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2679_c7_9be4_cond <= VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_cond;
     n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue;
     n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output := n16_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2679_c7_9be4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2688_c7_96e0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output;

     -- printf_uxn_opcodes_h_l2648_c3_65ff[uxn_opcodes_h_l2648_c3_65ff] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2648_c3_65ff_uxn_opcodes_h_l2648_c3_65ff_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2648_c3_65ff_uxn_opcodes_h_l2648_c3_65ff_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- CONST_SR_8[uxn_opcodes_h_l2686_c32_fc3f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_return_output := CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2664_c7_ffbe] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond <= VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond;
     t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue;
     t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output := t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue := VAR_MUX_uxn_opcodes_h_l2683_c32_cd6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2688_c7_96e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2676_c7_90b5] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2668_c7_d0d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2679_c7_9be4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2686_c22_b120] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2686_c22_b120_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2686_c32_fc3f_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2679_c7_9be4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2671_c7_aa05] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;

     -- n16_MUX[uxn_opcodes_h_l2676_c7_90b5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2676_c7_90b5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_cond;
     n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue;
     n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output := n16_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2676_c7_90b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;

     -- t16_MUX[uxn_opcodes_h_l2661_c7_33bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond;
     t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue;
     t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output := t16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2679_c7_9be4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2686_c22_b120_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2671_c7_aa05] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2664_c7_ffbe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2668_c7_d0d0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2676_c7_90b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2676_c7_90b5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2671_c7_aa05] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2671_c7_aa05_cond <= VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_cond;
     n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue;
     n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output := n16_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2679_c7_9be4] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output := result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;

     -- t16_MUX[uxn_opcodes_h_l2656_c7_e98f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond;
     t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue;
     t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output := t16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2671_c7_aa05] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2676_c7_90b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2679_c7_9be4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2661_c7_33bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2668_c7_d0d0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2671_c7_aa05] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2671_c7_aa05] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2671_c7_aa05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2664_c7_ffbe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2676_c7_90b5] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output := result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2668_c7_d0d0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond;
     n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue;
     n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output := n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2653_c7_8b3c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond;
     t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue;
     t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output := t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2668_c7_d0d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2676_c7_90b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2664_c7_ffbe] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2668_c7_d0d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2661_c7_33bc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2668_c7_d0d0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2671_c7_aa05] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output := result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2668_c7_d0d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2664_c7_ffbe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;

     -- n16_MUX[uxn_opcodes_h_l2664_c7_ffbe] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond <= VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond;
     n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue;
     n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output := n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;

     -- t16_MUX[uxn_opcodes_h_l2647_c2_328b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2647_c2_328b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_cond;
     t16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue;
     t16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output := t16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2656_c7_e98f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2671_c7_aa05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2656_c7_e98f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2664_c7_ffbe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2653_c7_8b3c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2664_c7_ffbe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2664_c7_ffbe] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2661_c7_33bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2668_c7_d0d0] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output := result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2661_c7_33bc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2661_c7_33bc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_cond;
     n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue;
     n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output := n16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2668_c7_d0d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2653_c7_8b3c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2656_c7_e98f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2664_c7_ffbe] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output := result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2656_c7_e98f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2647_c2_328b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2661_c7_33bc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;

     -- n16_MUX[uxn_opcodes_h_l2656_c7_e98f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_cond;
     n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue;
     n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output := n16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2661_c7_33bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2661_c7_33bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2664_c7_ffbe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2653_c7_8b3c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2656_c7_e98f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2647_c2_328b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2661_c7_33bc] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output := result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2656_c7_e98f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2653_c7_8b3c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond;
     n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue;
     n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output := n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2653_c7_8b3c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2656_c7_e98f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2661_c7_33bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2653_c7_8b3c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2653_c7_8b3c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2656_c7_e98f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output := result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2647_c2_328b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2653_c7_8b3c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2647_c2_328b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2647_c2_328b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_cond;
     n16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue;
     n16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output := n16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2647_c2_328b] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2656_c7_e98f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2647_c2_328b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2647_c2_328b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2653_c7_8b3c] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output := result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2647_c2_328b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;

     -- Submodule level 12
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2653_c7_8b3c_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2647_c2_328b] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_return_output := result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l2698_l2643_DUPLICATE_93c9 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l2698_l2643_DUPLICATE_93c9_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_475e(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2647_c2_328b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2647_c2_328b_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l2698_l2643_DUPLICATE_93c9_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l2698_l2643_DUPLICATE_93c9_return_output;
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

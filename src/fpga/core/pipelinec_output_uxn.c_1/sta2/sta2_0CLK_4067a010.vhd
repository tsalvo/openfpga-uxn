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
-- Submodules: 106
entity sta2_0CLK_4067a010 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_4067a010;
architecture arch of sta2_0CLK_4067a010 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2545_c6_2174]
signal BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2545_c2_b6af]
signal t16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2545_c2_b6af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2545_c2_b6af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2545_c2_b6af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2545_c2_b6af]
signal result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2545_c2_b6af]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2545_c2_b6af]
signal result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2545_c2_b6af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2545_c2_b6af]
signal n16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_6083]
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2550_c7_0e35]
signal t16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2550_c7_0e35]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_0e35]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2550_c7_0e35]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2550_c7_0e35]
signal result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2550_c7_0e35]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2550_c7_0e35]
signal result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_0e35]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2550_c7_0e35]
signal n16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2553_c11_0c65]
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2553_c7_f0db]
signal t16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2553_c7_f0db]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2553_c7_f0db]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2553_c7_f0db]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2553_c7_f0db]
signal result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2553_c7_f0db]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2553_c7_f0db]
signal result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2553_c7_f0db]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2553_c7_f0db]
signal n16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2558_c11_a04f]
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2558_c7_407f]
signal t16_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2558_c7_407f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2558_c7_407f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2558_c7_407f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2558_c7_407f]
signal result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2558_c7_407f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2558_c7_407f]
signal result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2558_c7_407f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2558_c7_407f]
signal n16_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_951f]
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2561_c7_ea8e]
signal t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_ea8e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_ea8e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2561_c7_ea8e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2561_c7_ea8e]
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2561_c7_ea8e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2561_c7_ea8e]
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_ea8e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2561_c7_ea8e]
signal n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2562_c3_13f1]
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2565_c11_739f]
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c7_8325]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c7_8325]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2565_c7_8325]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2565_c7_8325]
signal result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2565_c7_8325]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2565_c7_8325]
signal result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c7_8325]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2565_c7_8325]
signal n16_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2568_c11_da95]
signal BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2568_c7_439a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2568_c7_439a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2568_c7_439a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2568_c7_439a]
signal result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2568_c7_439a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2568_c7_439a]
signal result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2568_c7_439a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2568_c7_439a]
signal n16_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2573_c11_0db0]
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2573_c7_3f61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2573_c7_3f61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2573_c7_3f61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2573_c7_3f61]
signal result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2573_c7_3f61]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2573_c7_3f61]
signal result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2573_c7_3f61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2573_c7_3f61]
signal n16_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_d390]
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c7_e4a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_e4a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2576_c7_e4a1]
signal result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2576_c7_e4a1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2576_c7_e4a1]
signal result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_e4a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2576_c7_e4a1]
signal n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2577_c3_633c]
signal BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2579_c32_fe9d]
signal BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2579_c32_74b4]
signal BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2579_c32_608f]
signal MUX_uxn_opcodes_h_l2579_c32_608f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2579_c32_608f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2579_c32_608f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2579_c32_608f_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2582_c32_ab46]
signal CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_d122]
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2584_c7_11a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l2584_c7_11a8]
signal result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2584_c7_11a8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l2584_c7_11a8]
signal result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_11a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2586_c21_28ee]
signal BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2589_c11_67fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2589_c7_1a7a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2589_c7_1a7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_4841( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.ram_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174
BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_left,
BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_right,
BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output);

-- t16_MUX_uxn_opcodes_h_l2545_c2_b6af
t16_MUX_uxn_opcodes_h_l2545_c2_b6af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond,
t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue,
t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse,
t16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af
result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af
result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af
result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_cond,
result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af
result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af
result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af
result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output);

-- n16_MUX_uxn_opcodes_h_l2545_c2_b6af
n16_MUX_uxn_opcodes_h_l2545_c2_b6af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond,
n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue,
n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse,
n16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_left,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_right,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output);

-- t16_MUX_uxn_opcodes_h_l2550_c7_0e35
t16_MUX_uxn_opcodes_h_l2550_c7_0e35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond,
t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue,
t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse,
t16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35
result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_cond,
result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35
result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35
result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output);

-- n16_MUX_uxn_opcodes_h_l2550_c7_0e35
n16_MUX_uxn_opcodes_h_l2550_c7_0e35 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond,
n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue,
n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse,
n16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_left,
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_right,
BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output);

-- t16_MUX_uxn_opcodes_h_l2553_c7_f0db
t16_MUX_uxn_opcodes_h_l2553_c7_f0db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond,
t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue,
t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse,
t16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db
result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db
result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_cond,
result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db
result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db
result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output);

-- n16_MUX_uxn_opcodes_h_l2553_c7_f0db
n16_MUX_uxn_opcodes_h_l2553_c7_f0db : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond,
n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue,
n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse,
n16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_left,
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_right,
BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output);

-- t16_MUX_uxn_opcodes_h_l2558_c7_407f
t16_MUX_uxn_opcodes_h_l2558_c7_407f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2558_c7_407f_cond,
t16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue,
t16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse,
t16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f
result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_cond,
result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f
result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f
result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_return_output);

-- n16_MUX_uxn_opcodes_h_l2558_c7_407f
n16_MUX_uxn_opcodes_h_l2558_c7_407f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2558_c7_407f_cond,
n16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue,
n16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse,
n16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_left,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_right,
BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output);

-- t16_MUX_uxn_opcodes_h_l2561_c7_ea8e
t16_MUX_uxn_opcodes_h_l2561_c7_ea8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond,
t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue,
t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse,
t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond,
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output);

-- n16_MUX_uxn_opcodes_h_l2561_c7_ea8e
n16_MUX_uxn_opcodes_h_l2561_c7_ea8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond,
n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue,
n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse,
n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1
BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_left,
BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_right,
BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_left,
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_right,
BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325
result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_cond,
result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325
result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_return_output);

-- n16_MUX_uxn_opcodes_h_l2565_c7_8325
n16_MUX_uxn_opcodes_h_l2565_c7_8325 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2565_c7_8325_cond,
n16_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue,
n16_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse,
n16_MUX_uxn_opcodes_h_l2565_c7_8325_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_left,
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_right,
BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a
result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a
result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_cond,
result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a
result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a
result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a
result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_return_output);

-- n16_MUX_uxn_opcodes_h_l2568_c7_439a
n16_MUX_uxn_opcodes_h_l2568_c7_439a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2568_c7_439a_cond,
n16_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue,
n16_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse,
n16_MUX_uxn_opcodes_h_l2568_c7_439a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_left,
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_right,
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61
result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_cond,
result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61
result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61
result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output);

-- n16_MUX_uxn_opcodes_h_l2573_c7_3f61
n16_MUX_uxn_opcodes_h_l2573_c7_3f61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2573_c7_3f61_cond,
n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue,
n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse,
n16_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_left,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_right,
BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1
result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond,
result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1
result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1
result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output);

-- n16_MUX_uxn_opcodes_h_l2576_c7_e4a1
n16_MUX_uxn_opcodes_h_l2576_c7_e4a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond,
n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue,
n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse,
n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c
BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_left,
BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_right,
BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d
BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_left,
BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_right,
BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4
BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_left,
BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_right,
BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_return_output);

-- MUX_uxn_opcodes_h_l2579_c32_608f
MUX_uxn_opcodes_h_l2579_c32_608f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2579_c32_608f_cond,
MUX_uxn_opcodes_h_l2579_c32_608f_iftrue,
MUX_uxn_opcodes_h_l2579_c32_608f_iffalse,
MUX_uxn_opcodes_h_l2579_c32_608f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46
CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_x,
CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_left,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_right,
BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8
result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_cond,
result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8
result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8
result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee
BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_left,
BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_right,
BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a
result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9
CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output,
 t16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
 n16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output,
 t16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output,
 n16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output,
 t16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output,
 n16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output,
 t16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_return_output,
 n16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output,
 t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output,
 n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_return_output,
 n16_MUX_uxn_opcodes_h_l2565_c7_8325_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_return_output,
 n16_MUX_uxn_opcodes_h_l2568_c7_439a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output,
 n16_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output,
 n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_return_output,
 MUX_uxn_opcodes_h_l2579_c32_608f_return_output,
 CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_b3db : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_87ff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2556_c3_e763 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_c1ea : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_69c6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2566_c3_e482 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_aa8e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_826d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2573_c7_3f61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2579_c32_608f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2579_c32_608f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2579_c32_608f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2579_c32_608f_return_output : signed(7 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2582_c22_a2f0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l2586_c3_1001 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2587_c22_d21b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2562_l2577_l2554_l2569_DUPLICATE_82f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l2594_l2541_DUPLICATE_5f25_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_aa8e := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_aa8e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_c1ea := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2559_c3_c1ea;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_826d := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2574_c3_826d;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2556_c3_e763 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2556_c3_e763;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_b3db := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2547_c3_b3db;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l2579_c32_608f_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_69c6 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2563_c3_69c6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2566_c3_e482 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2566_c3_e482;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l2579_c32_608f_iffalse := resize(to_signed(-4, 4), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_right := to_unsigned(10, 4);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_87ff := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2551_c3_87ff;

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse := t16;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output := result.ram_value;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2586_c21_28ee] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2584_c11_d122] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_left;
     BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output := BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2545_c6_2174] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_left;
     BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output := BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2568_c11_da95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_left;
     BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output := BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_6083] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_left;
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output := BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2561_c11_951f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2562_l2577_l2554_l2569_DUPLICATE_82f8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2562_l2577_l2554_l2569_DUPLICATE_82f8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2573_c7_3f61] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2573_c7_3f61_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2576_c11_d390] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_left;
     BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output := BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2579_c32_fe9d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_left;
     BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_return_output := BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2587_c22_d21b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2587_c22_d21b_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2573_c11_0db0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2565_c11_739f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2558_c11_a04f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2589_c11_67fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2553_c11_0c65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_left;
     BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output := BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2579_c32_fe9d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2545_c6_2174_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_6083_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2553_c11_0c65_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2558_c11_a04f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2561_c11_951f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2565_c11_739f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2568_c11_da95_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_0db0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2576_c11_d390_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2584_c11_d122_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2589_c11_67fa_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l2586_c3_1001 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2586_c21_28ee_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2562_l2577_l2554_l2569_DUPLICATE_82f8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2562_l2577_l2554_l2569_DUPLICATE_82f8_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2562_l2577_l2554_l2569_DUPLICATE_82f8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2587_c22_d21b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2545_l2568_l2565_l2561_l2558_DUPLICATE_fb36_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_3f23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2553_l2576_l2550_l2573_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_2a46_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2589_l2558_l2584_DUPLICATE_9447_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_7964_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l2553_l2550_l2573_l2545_l2568_l2565_l2561_l2558_l2584_DUPLICATE_0503_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2573_c7_3f61_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l2586_c3_1001;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2584_c7_11a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2562_c3_13f1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_left;
     BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_return_output := BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2584_c7_11a8] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output := result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2577_c3_633c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_left;
     BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_return_output := BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2584_c7_11a8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2579_c32_74b4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_left;
     BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_return_output := BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2589_c7_1a7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2573_c7_3f61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2589_c7_1a7a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2579_c32_608f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2579_c32_74b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2562_c3_13f1_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2577_c3_633c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2555_l2570_DUPLICATE_7ab9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2589_c7_1a7a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;
     -- CONST_SR_8[uxn_opcodes_h_l2582_c32_ab46] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_return_output := CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_return_output;

     -- t16_MUX[uxn_opcodes_h_l2561_c7_ea8e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond;
     t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue;
     t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output := t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2576_c7_e4a1] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2584_c7_11a8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2576_c7_e4a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;

     -- MUX[uxn_opcodes_h_l2579_c32_608f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2579_c32_608f_cond <= VAR_MUX_uxn_opcodes_h_l2579_c32_608f_cond;
     MUX_uxn_opcodes_h_l2579_c32_608f_iftrue <= VAR_MUX_uxn_opcodes_h_l2579_c32_608f_iftrue;
     MUX_uxn_opcodes_h_l2579_c32_608f_iffalse <= VAR_MUX_uxn_opcodes_h_l2579_c32_608f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2579_c32_608f_return_output := MUX_uxn_opcodes_h_l2579_c32_608f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2576_c7_e4a1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond <= VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond;
     n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue;
     n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output := n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2584_c7_11a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2568_c7_439a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue := VAR_MUX_uxn_opcodes_h_l2579_c32_608f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2584_c7_11a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2565_c7_8325] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2573_c7_3f61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2573_c7_3f61] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2576_c7_e4a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2558_c7_407f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2558_c7_407f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_cond;
     t16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue;
     t16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output := t16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2576_c7_e4a1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2576_c7_e4a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;

     -- n16_MUX[uxn_opcodes_h_l2573_c7_3f61] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2573_c7_3f61_cond <= VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_cond;
     n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue;
     n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output := n16_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2582_c22_a2f0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2582_c22_a2f0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2582_c32_ab46_return_output);

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2582_c22_a2f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2561_c7_ea8e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2568_c7_439a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2568_c7_439a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_cond;
     n16_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue;
     n16_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_return_output := n16_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2576_c7_e4a1] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output := result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2573_c7_3f61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2568_c7_439a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2573_c7_3f61] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2573_c7_3f61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;

     -- t16_MUX[uxn_opcodes_h_l2553_c7_f0db] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond <= VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond;
     t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue;
     t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output := t16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2568_c7_439a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2576_c7_e4a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2573_c7_3f61] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output := result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2568_c7_439a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2558_c7_407f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2568_c7_439a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2565_c7_8325] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;

     -- t16_MUX[uxn_opcodes_h_l2550_c7_0e35] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond <= VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond;
     t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue;
     t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output := t16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;

     -- n16_MUX[uxn_opcodes_h_l2565_c7_8325] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2565_c7_8325_cond <= VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_cond;
     n16_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue;
     n16_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_return_output := n16_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2565_c7_8325] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2568_c7_439a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2573_c7_3f61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2553_c7_f0db] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2561_c7_ea8e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2568_c7_439a] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_return_output := result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2565_c7_8325] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;

     -- t16_MUX[uxn_opcodes_h_l2545_c2_b6af] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond <= VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond;
     t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue;
     t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output := t16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;

     -- n16_MUX[uxn_opcodes_h_l2561_c7_ea8e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond;
     n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue;
     n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output := n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2561_c7_ea8e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2565_c7_8325] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2565_c7_8325] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2568_c7_439a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l2558_c7_407f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2558_c7_407f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2565_c7_8325] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_return_output := result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_0e35] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2561_c7_ea8e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2561_c7_ea8e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2561_c7_ea8e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2558_c7_407f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2558_c7_407f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_cond;
     n16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue;
     n16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output := n16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2565_c7_8325_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;
     -- n16_MUX[uxn_opcodes_h_l2553_c7_f0db] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond <= VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_cond;
     n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue;
     n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output := n16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2545_c2_b6af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2558_c7_407f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2553_c7_f0db] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2558_c7_407f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2558_c7_407f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2553_c7_f0db] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2561_c7_ea8e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output := result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2561_c7_ea8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2550_c7_0e35] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2558_c7_407f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_return_output := result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2550_c7_0e35] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond <= VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_cond;
     n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue;
     n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output := n16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2553_c7_f0db] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2553_c7_f0db] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2550_c7_0e35] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2553_c7_f0db] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2558_c7_407f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2553_c7_f0db] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output := result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_0e35] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2550_c7_0e35] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;

     -- n16_MUX[uxn_opcodes_h_l2545_c2_b6af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond <= VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_cond;
     n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue;
     n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output := n16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2545_c2_b6af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2550_c7_0e35] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l2545_c2_b6af] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output := result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2553_c7_f0db_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2545_c2_b6af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2545_c2_b6af] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2545_c2_b6af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l2550_c7_0e35] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output := result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;

     -- Submodule level 12
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l2550_c7_0e35_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l2545_c2_b6af] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_cond;
     result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output := result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l2594_l2541_DUPLICATE_5f25 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l2594_l2541_DUPLICATE_5f25_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_4841(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2545_c2_b6af_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l2594_l2541_DUPLICATE_5f25_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_4841_uxn_opcodes_h_l2594_l2541_DUPLICATE_5f25_return_output;
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

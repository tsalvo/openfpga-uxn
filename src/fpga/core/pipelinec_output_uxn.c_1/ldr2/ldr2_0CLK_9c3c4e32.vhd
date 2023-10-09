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
-- Submodules: 94
entity ldr2_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_9c3c4e32;
architecture arch of ldr2_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1853_c6_52f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1853_c1_2d19]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1853_c2_f9ed]
signal tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1854_c3_4873[uxn_opcodes_h_l1854_c3_4873]
signal printf_uxn_opcodes_h_l1854_c3_4873_uxn_opcodes_h_l1854_c3_4873_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_32f5]
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal t8_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1859_c7_95e7]
signal tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1862_c11_2e85]
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(7 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1862_c7_1e4e]
signal tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1866_c32_f60e]
signal BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1866_c32_d6a6]
signal BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1866_c32_74d3]
signal MUX_uxn_opcodes_h_l1866_c32_74d3_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1866_c32_74d3_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1866_c32_74d3_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1866_c32_74d3_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1868_c21_78f3]
signal BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_7d9c]
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1870_c7_233a]
signal result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1870_c7_233a]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1870_c7_233a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1870_c7_233a]
signal result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_233a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_233a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_233a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1870_c7_233a]
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_70bb]
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1874_c7_c1d4]
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1874_c7_c1d4]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1874_c7_c1d4]
signal result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_c1d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_c1d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_c1d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1874_c7_c1d4]
signal tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1876_c3_f103]
signal CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1877_c21_b97e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1879_c11_73cc]
signal BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1879_c7_8488]
signal result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1879_c7_8488]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1879_c7_8488]
signal result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1879_c7_8488]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1879_c7_8488]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1879_c7_8488]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1879_c7_8488]
signal tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1880_c21_f7e6]
signal BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_a9e7]
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1882_c7_e4cc]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1882_c7_e4cc]
signal result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_e4cc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_e4cc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_e4cc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1882_c7_e4cc]
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1883_c3_8909]
signal BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_9a3f]
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1889_c7_5924]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1889_c7_5924]
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1889_c7_5924]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1889_c7_5924]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1891_c34_9b4d]
signal CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1893_c11_e99d]
signal BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1893_c7_1849]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1893_c7_1849]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_return_output : signed(17 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c22c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_read := ref_toks_7;
      base.is_stack_write := ref_toks_8;
      base.ram_addr := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8
BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_return_output);

-- t8_MUX_uxn_opcodes_h_l1853_c2_f9ed
t8_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed
result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed
result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed
result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed
result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed
tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond,
tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue,
tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse,
tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

-- printf_uxn_opcodes_h_l1854_c3_4873_uxn_opcodes_h_l1854_c3_4873
printf_uxn_opcodes_h_l1854_c3_4873_uxn_opcodes_h_l1854_c3_4873 : entity work.printf_uxn_opcodes_h_l1854_c3_4873_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1854_c3_4873_uxn_opcodes_h_l1854_c3_4873_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_left,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_right,
BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output);

-- t8_MUX_uxn_opcodes_h_l1859_c7_95e7
t8_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
t8_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7
result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7
result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7
result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7
result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7
tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_cond,
tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue,
tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse,
tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_left,
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_right,
BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output);

-- t8_MUX_uxn_opcodes_h_l1862_c7_1e4e
t8_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e
result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e
result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e
result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e
result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e
tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond,
tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue,
tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse,
tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e
BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_left,
BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_right,
BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6
BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_left,
BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_right,
BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_return_output);

-- MUX_uxn_opcodes_h_l1866_c32_74d3
MUX_uxn_opcodes_h_l1866_c32_74d3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1866_c32_74d3_cond,
MUX_uxn_opcodes_h_l1866_c32_74d3_iftrue,
MUX_uxn_opcodes_h_l1866_c32_74d3_iffalse,
MUX_uxn_opcodes_h_l1866_c32_74d3_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3
BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_left,
BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_right,
BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_left,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_right,
BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a
result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a
result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a
result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1870_c7_233a
tmp16_MUX_uxn_opcodes_h_l1870_c7_233a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_cond,
tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_left,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_right,
BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4
result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4
result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4
tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond,
tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue,
tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse,
tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1876_c3_f103
CONST_SL_8_uxn_opcodes_h_l1876_c3_f103 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_x,
CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e
BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_left,
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_right,
BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488
result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488
result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488
result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_cond,
result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488
result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488
result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1879_c7_8488
tmp16_MUX_uxn_opcodes_h_l1879_c7_8488 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_cond,
tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue,
tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse,
tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6
BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_left,
BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_right,
BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_left,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_right,
BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc
result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc
result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc
tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond,
tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue,
tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse,
tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909
BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_left,
BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_right,
BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_left,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_right,
BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_cond,
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d
CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_x,
CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d
BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_left,
BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_right,
BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849
result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849
result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_return_output,
 t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output,
 t8_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output,
 t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_return_output,
 MUX_uxn_opcodes_h_l1866_c32_74d3_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output,
 tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output,
 CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_return_output,
 tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output,
 tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_return_output,
 CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_8397 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1854_c3_4873_uxn_opcodes_h_l1854_c3_4873_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1860_c3_e790 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1868_c3_d750 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1868_c26_bc0b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1872_c3_00c3 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1877_c3_7ed8 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1880_c3_a560 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_cb3e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1887_c24_d6eb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_37db : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1891_c24_89d1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1853_l1859_l1862_DUPLICATE_1929_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1859_l1889_l1853_DUPLICATE_8025_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1853_l1870_l1859_DUPLICATE_6c02_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1859_l1853_l1882_DUPLICATE_50c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1879_l1853_l1859_DUPLICATE_a873_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1862_DUPLICATE_7cc2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1889_DUPLICATE_b498_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1872_l1880_l1877_DUPLICATE_ac8c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_return_output : signed(17 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1875_l1883_DUPLICATE_28fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1898_l1848_DUPLICATE_8fe7_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_37db := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1890_c3_37db;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_right := to_unsigned(7, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_cb3e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1886_c3_cb3e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_8397 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1856_c3_8397;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1860_c3_e790 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1860_c3_e790;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue := to_unsigned(0, 1);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := t8;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_left := tmp16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1891_c34_9b4d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_return_output := CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1859_l1889_l1853_DUPLICATE_8025 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1859_l1889_l1853_DUPLICATE_8025_return_output := result.stack_value;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1872_l1880_l1877_DUPLICATE_ac8c LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1872_l1880_l1877_DUPLICATE_ac8c_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1882_c11_a9e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1862_c11_2e85] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_left;
     BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output := BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1859_c11_32f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a_return_output := result.is_stack_write;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1853_l1859_l1862_DUPLICATE_1929 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1853_l1859_l1862_DUPLICATE_1929_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1853_c6_52f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1868_c26_bc0b] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1868_c26_bc0b_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_AND[uxn_opcodes_h_l1866_c32_f60e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_left;
     BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_return_output := BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1874_c11_70bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1859_l1853_l1882_DUPLICATE_50c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1859_l1853_l1882_DUPLICATE_50c5_return_output := result.is_ram_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1879_l1853_l1859_DUPLICATE_a873 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1879_l1853_l1859_DUPLICATE_a873_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1893_c11_e99d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1889_c11_9a3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1853_l1870_l1859_DUPLICATE_6c02 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1853_l1870_l1859_DUPLICATE_6c02_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1870_c11_7d9c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1889_DUPLICATE_b498 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1889_DUPLICATE_b498_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1862_DUPLICATE_7cc2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1862_DUPLICATE_7cc2_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1879_c11_73cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1875_l1883_DUPLICATE_28fe LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1875_l1883_DUPLICATE_28fe_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_ram_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1866_c32_f60e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1853_c6_52f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1859_c11_32f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1862_c11_2e85_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1870_c11_7d9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1874_c11_70bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1879_c11_73cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1882_c11_a9e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1889_c11_9a3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1893_c11_e99d_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1868_c26_bc0b_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1872_l1880_l1877_DUPLICATE_ac8c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1875_l1883_DUPLICATE_28fe_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1875_l1883_DUPLICATE_28fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1853_l1859_l1862_DUPLICATE_1929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1853_l1859_l1862_DUPLICATE_1929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1853_l1859_l1862_DUPLICATE_1929_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1879_l1853_l1859_DUPLICATE_a873_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1879_l1853_l1859_DUPLICATE_a873_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1879_l1853_l1859_DUPLICATE_a873_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1882_DUPLICATE_9c5b_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1859_l1853_l1882_DUPLICATE_50c5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1859_l1853_l1882_DUPLICATE_50c5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1859_l1853_l1882_DUPLICATE_50c5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1859_l1853_l1882_DUPLICATE_50c5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1859_l1853_l1882_DUPLICATE_50c5_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1859_l1853_l1882_DUPLICATE_50c5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1853_l1870_l1859_DUPLICATE_6c02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1853_l1870_l1859_DUPLICATE_6c02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1853_l1870_l1859_DUPLICATE_6c02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1862_DUPLICATE_7cc2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1859_l1862_DUPLICATE_7cc2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1893_l1859_l1889_l1853_DUPLICATE_5a8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1889_DUPLICATE_b498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1889_DUPLICATE_b498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1889_DUPLICATE_b498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1889_DUPLICATE_b498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1889_DUPLICATE_b498_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1859_l1889_l1853_DUPLICATE_8025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1859_l1889_l1853_DUPLICATE_8025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1859_l1889_l1853_DUPLICATE_8025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1859_l1889_l1853_DUPLICATE_8025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1859_l1889_l1853_DUPLICATE_8025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1859_l1889_l1853_DUPLICATE_8025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1879_l1874_l1870_l1862_l1859_l1889_l1853_DUPLICATE_8025_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_return_output;

     -- t8_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1882_c7_e4cc] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1868_c21_78f3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1893_c7_1849] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1866_c32_d6a6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_left;
     BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_return_output := BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1889_c7_5924] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1891_c24_89d1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1891_c24_89d1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1891_c34_9b4d_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1870_c7_233a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1883_c3_8909] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_left;
     BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_return_output := BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1876_c3_f103] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_return_output := CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1893_c7_1849] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1853_c1_2d19] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1866_c32_d6a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1868_c3_d750 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1868_c21_78f3_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1872_c3_00c3 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1880_l1877_l1872_DUPLICATE_95aa_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1891_c24_89d1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1876_c3_f103_return_output;
     VAR_printf_uxn_opcodes_h_l1854_c3_4873_uxn_opcodes_h_l1854_c3_4873_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1853_c1_2d19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1893_c7_1849_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1893_c7_1849_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1889_c7_5924_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1868_c3_d750;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1872_c3_00c3;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1889_c7_5924] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1889_c7_5924] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1887_c24_d6eb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1887_c24_d6eb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l1883_c3_8909_return_output);

     -- t8_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := t8_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- printf_uxn_opcodes_h_l1854_c3_4873[uxn_opcodes_h_l1854_c3_4873] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1854_c3_4873_uxn_opcodes_h_l1854_c3_4873_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1854_c3_4873_uxn_opcodes_h_l1854_c3_4873_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1889_c7_5924] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_return_output := result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1880_c21_f7e6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1877_c21_b97e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_return_output;

     -- MUX[uxn_opcodes_h_l1866_c32_74d3] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1866_c32_74d3_cond <= VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_cond;
     MUX_uxn_opcodes_h_l1866_c32_74d3_iftrue <= VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_iftrue;
     MUX_uxn_opcodes_h_l1866_c32_74d3_iffalse <= VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_return_output := MUX_uxn_opcodes_h_l1866_c32_74d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1882_c7_e4cc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1882_c7_e4cc] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond;
     tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output := tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1879_c7_8488] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;

     -- Submodule level 3
     VAR_result_ram_addr_uxn_opcodes_h_l1877_c3_7ed8 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1877_c21_b97e_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1880_c3_a560 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1880_c21_f7e6_return_output)),16);
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1887_c24_d6eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue := VAR_MUX_uxn_opcodes_h_l1866_c32_74d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1889_c7_5924_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1889_c7_5924_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1889_c7_5924_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1877_c3_7ed8;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1880_c3_a560;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1882_c7_e4cc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1879_c7_8488] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1879_c7_8488] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1882_c7_e4cc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1879_c7_8488] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_cond;
     tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_return_output := tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1882_c7_e4cc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1874_c7_c1d4] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1882_c7_e4cc_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1879_c7_8488] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_return_output := result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1874_c7_c1d4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond;
     tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output := tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1874_c7_c1d4] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1874_c7_c1d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1879_c7_8488] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1870_c7_233a] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1879_c7_8488] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1879_c7_8488_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1874_c7_c1d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1870_c7_233a] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1870_c7_233a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1874_c7_c1d4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1874_c7_c1d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1870_c7_233a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_cond;
     tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_return_output := tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1874_c7_c1d4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1870_c7_233a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1870_c7_233a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1870_c7_233a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1870_c7_233a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1862_c7_1e4e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1862_c7_1e4e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1859_c7_95e7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1859_c7_95e7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1853_c2_f9ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1898_l1848_DUPLICATE_8fe7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1898_l1848_DUPLICATE_8fe7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c22c(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1853_c2_f9ed_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1898_l1848_DUPLICATE_8fe7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c22c_uxn_opcodes_h_l1898_l1848_DUPLICATE_8fe7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;

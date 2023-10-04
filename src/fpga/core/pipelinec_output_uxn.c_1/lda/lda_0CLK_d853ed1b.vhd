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
-- Submodules: 96
entity lda_0CLK_d853ed1b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_d853ed1b;
architecture arch of lda_0CLK_d853ed1b is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1364_c6_bd93]
signal BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1364_c1_1d6b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal t16_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1364_c2_acbf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1365_c3_86ed[uxn_opcodes_h_l1365_c3_86ed]
signal printf_uxn_opcodes_h_l1365_c3_86ed_uxn_opcodes_h_l1365_c3_86ed_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1370_c11_0b73]
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal t16_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1370_c7_85ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_3ef2]
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal t16_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_e98c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1375_c3_8c5a]
signal CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_2009]
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_f7d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_9d6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal t16_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : signed(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(15 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_85d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1382_c3_ca78]
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1385_c32_b110]
signal BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1385_c32_0356]
signal BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1385_c32_5e57]
signal MUX_uxn_opcodes_h_l1385_c32_5e57_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1385_c32_5e57_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1385_c32_5e57_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1385_c32_5e57_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1387_c11_2ed1]
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1387_c7_0617]
signal tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1387_c7_0617]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1387_c7_0617]
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1387_c7_0617]
signal result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1387_c7_0617]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1387_c7_0617]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1387_c7_0617]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1387_c7_0617]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1392_c11_911f]
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1392_c7_e7fb]
signal tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1392_c7_e7fb]
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1392_c7_e7fb]
signal result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1392_c7_e7fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1392_c7_e7fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1392_c7_e7fb]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1392_c7_e7fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1395_c11_6dbd]
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1395_c7_3693]
signal tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1395_c7_3693]
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c7_3693]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c7_3693]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(0 downto 0);

-- result_is_ram_read_MUX[uxn_opcodes_h_l1395_c7_3693]
signal result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(0 downto 0);
signal result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c7_3693]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1402_c11_221c]
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1402_c7_d960]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1402_c7_d960]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_f637( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_read := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.ram_addr := ref_toks_7;
      base.is_ram_read := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93
BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_left,
BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_right,
BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf
tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- t16_MUX_uxn_opcodes_h_l1364_c2_acbf
t16_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
t16_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf
result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf
result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf
result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf
result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf
result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf
result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf
result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf
result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

-- printf_uxn_opcodes_h_l1365_c3_86ed_uxn_opcodes_h_l1365_c3_86ed
printf_uxn_opcodes_h_l1365_c3_86ed_uxn_opcodes_h_l1365_c3_86ed : entity work.printf_uxn_opcodes_h_l1365_c3_86ed_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1365_c3_86ed_uxn_opcodes_h_l1365_c3_86ed_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_left,
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_right,
BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec
tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- t16_MUX_uxn_opcodes_h_l1370_c7_85ec
t16_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
t16_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec
result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec
result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec
result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec
result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_left,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_right,
BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c
tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- t16_MUX_uxn_opcodes_h_l1373_c7_e98c
t16_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
t16_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c
result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c
result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a
CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_x,
CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_left,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_right,
BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8
tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- t16_MUX_uxn_opcodes_h_l1378_c7_f7d8
t16_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8
result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8
result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8
result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8
result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0
tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- t16_MUX_uxn_opcodes_h_l1381_c7_85d0
t16_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
t16_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0
result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0
result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78
BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_left,
BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_right,
BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110
BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_left,
BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_right,
BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356
BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_left,
BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_right,
BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_return_output);

-- MUX_uxn_opcodes_h_l1385_c32_5e57
MUX_uxn_opcodes_h_l1385_c32_5e57 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1385_c32_5e57_cond,
MUX_uxn_opcodes_h_l1385_c32_5e57_iftrue,
MUX_uxn_opcodes_h_l1385_c32_5e57_iffalse,
MUX_uxn_opcodes_h_l1385_c32_5e57_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_left,
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_right,
BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1387_c7_0617
tmp8_MUX_uxn_opcodes_h_l1387_c7_0617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_cond,
tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue,
tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse,
tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_cond,
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617
result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617
result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_left,
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_right,
BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb
tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond,
tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue,
tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse,
tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb
result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb
result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_left,
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_right,
BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1395_c7_3693
tmp8_MUX_uxn_opcodes_h_l1395_c7_3693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_cond,
tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue,
tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse,
tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_cond,
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_return_output);

-- result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693
result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_cond,
result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue,
result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse,
result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_left,
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_right,
BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_return_output,
 tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 t16_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output,
 tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 t16_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output,
 tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 t16_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output,
 CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output,
 tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output,
 tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 t16_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_return_output,
 MUX_uxn_opcodes_h_l1385_c32_5e57_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output,
 tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output,
 tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output,
 tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_return_output,
 result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iffalse : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1367_c3_5d99 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1365_c3_86ed_uxn_opcodes_h_l1365_c3_86ed_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_54c7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_460e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_0883 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1399_c3_f526 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1378_l1373_l1370_l1364_DUPLICATE_b3fc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_DUPLICATE_084e_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_l1392_DUPLICATE_11f5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_c3e7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1381_l1373_l1378_DUPLICATE_4bea_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1374_l1382_DUPLICATE_d64b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1395_l1387_l1392_DUPLICATE_d5be_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f637_uxn_opcodes_h_l1407_l1359_DUPLICATE_4d56_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_460e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1376_c3_460e;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_right := to_unsigned(0, 1);
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_0883 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1379_c3_0883;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_54c7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1371_c3_54c7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1367_c3_5d99 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1367_c3_5d99;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1399_c3_f526 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1399_c3_f526;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_right := to_unsigned(128, 8);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_left := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue := t16;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse := tmp8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837_return_output := result.stack_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1395_l1387_l1392_DUPLICATE_d5be LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1395_l1387_l1392_DUPLICATE_d5be_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1370_c11_0b73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_left;
     BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output := BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1385_c32_b110] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_left;
     BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_return_output := BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1374_l1382_DUPLICATE_d64b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1374_l1382_DUPLICATE_d64b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1395_c11_6dbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1381_l1373_l1378_DUPLICATE_4bea LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1381_l1373_l1378_DUPLICATE_4bea_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_l1392_DUPLICATE_11f5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_l1392_DUPLICATE_11f5_return_output := result.ram_addr;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1378_c11_2009] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_left;
     BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output := BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1402_c11_221c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1387_c11_2ed1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1378_l1373_l1370_l1364_DUPLICATE_b3fc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1378_l1373_l1370_l1364_DUPLICATE_b3fc_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_DUPLICATE_084e LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_DUPLICATE_084e_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1392_c11_911f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1381_c11_9d6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_c3e7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_c3e7_return_output := result.is_ram_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1364_c6_bd93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1373_c11_3ef2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1385_c32_b110_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1364_c6_bd93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1370_c11_0b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1373_c11_3ef2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1378_c11_2009_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1381_c11_9d6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1387_c11_2ed1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1392_c11_911f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1395_c11_6dbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1402_c11_221c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1374_l1382_DUPLICATE_d64b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1374_l1382_DUPLICATE_d64b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_DUPLICATE_084e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_DUPLICATE_084e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_DUPLICATE_084e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_DUPLICATE_084e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_DUPLICATE_084e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_l1392_DUPLICATE_11f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_l1392_DUPLICATE_11f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_l1392_DUPLICATE_11f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_l1392_DUPLICATE_11f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_l1392_DUPLICATE_11f5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1364_l1392_DUPLICATE_11f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1395_l1392_DUPLICATE_cfe7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_c3e7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_c3e7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_c3e7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_c3e7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_c3e7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_c3e7_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_read_d41d_uxn_opcodes_h_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_c3e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1378_l1373_l1370_l1364_DUPLICATE_b3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1378_l1373_l1370_l1364_DUPLICATE_b3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1378_l1373_l1370_l1364_DUPLICATE_b3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1378_l1373_l1370_l1364_DUPLICATE_b3fc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1387_l1378_l1373_l1370_l1364_DUPLICATE_b3fc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1381_l1373_l1378_DUPLICATE_4bea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1381_l1373_l1378_DUPLICATE_4bea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1381_l1373_l1378_DUPLICATE_4bea_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1370_l1381_l1373_l1378_DUPLICATE_4bea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1402_l1370_l1364_l1392_DUPLICATE_fe54_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1395_l1387_l1392_DUPLICATE_d5be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1395_l1387_l1392_DUPLICATE_d5be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1395_l1387_l1392_DUPLICATE_d5be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1381_l1395_l1387_l1392_DUPLICATE_d5be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1387_l1381_l1378_l1373_l1370_l1395_l1364_l1392_DUPLICATE_1837_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1402_c7_d960] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1395_c7_3693] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1392_c7_e7fb] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1402_c7_d960] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1387_c7_0617] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1395_c7_3693] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_return_output := result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1375_c3_8c5a] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_return_output := CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1382_c3_ca78] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_left;
     BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_return_output := BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1385_c32_0356] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_left;
     BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_return_output := BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1364_c1_1d6b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1395_c7_3693] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1395_c7_3693] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_cond;
     tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_return_output := tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1385_c32_0356_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1382_c3_ca78_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1375_c3_8c5a_return_output;
     VAR_printf_uxn_opcodes_h_l1365_c3_86ed_uxn_opcodes_h_l1365_c3_86ed_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1364_c1_1d6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1402_c7_d960_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1402_c7_d960_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1395_c7_3693] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;

     -- t16_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := t16_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1387_c7_0617] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1392_c7_e7fb] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1392_c7_e7fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;

     -- printf_uxn_opcodes_h_l1365_c3_86ed[uxn_opcodes_h_l1365_c3_86ed] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1365_c3_86ed_uxn_opcodes_h_l1365_c3_86ed_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1365_c3_86ed_uxn_opcodes_h_l1365_c3_86ed_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- tmp8_MUX[uxn_opcodes_h_l1392_c7_e7fb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond;
     tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output := tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1392_c7_e7fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- MUX[uxn_opcodes_h_l1385_c32_5e57] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1385_c32_5e57_cond <= VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_cond;
     MUX_uxn_opcodes_h_l1385_c32_5e57_iftrue <= VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_iftrue;
     MUX_uxn_opcodes_h_l1385_c32_5e57_iffalse <= VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_return_output := MUX_uxn_opcodes_h_l1385_c32_5e57_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1395_c7_3693] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue := VAR_MUX_uxn_opcodes_h_l1385_c32_5e57_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1395_c7_3693_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1387_c7_0617] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1392_c7_e7fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1387_c7_0617] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1392_c7_e7fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1387_c7_0617] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_cond;
     tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_return_output := tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;

     -- t16_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1387_c7_0617] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_return_output := result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1392_c7_e7fb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1387_c7_0617] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- t16_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := t16_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1387_c7_0617] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1387_c7_0617_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- t16_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := t16_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1381_c7_85d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1381_c7_85d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1378_c7_f7d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- t16_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := t16_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1378_c7_f7d8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- result_is_ram_read_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1373_c7_e98c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1373_c7_e98c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     -- result_is_ram_read_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1370_c7_85ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1370_c7_85ec_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1364_c2_acbf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_f637_uxn_opcodes_h_l1407_l1359_DUPLICATE_4d56 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f637_uxn_opcodes_h_l1407_l1359_DUPLICATE_4d56_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_f637(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
     VAR_result_is_ram_read_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1364_c2_acbf_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f637_uxn_opcodes_h_l1407_l1359_DUPLICATE_4d56_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_f637_uxn_opcodes_h_l1407_l1359_DUPLICATE_4d56_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
